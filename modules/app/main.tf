# ECS Cluster
resource "aws_ecs_cluster" "this" {
  name = var.cluster_name
}

# ECS Task Definition
resource "aws_ecs_task_definition" "nginx" {
  family                   = "nginx-task-fargate-demo"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"

  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "nginx"
      image     = "nginx:latest"
      essential = true
      portMappings = [
        {
          containerPort = 80
          protocol      = "tcp"
        }
      ],
      command = [
        "sh", "-c", "echo \"<h1>Hello from $(hostname)</h1>\" > /usr/share/nginx/html/index.html && nginx -g 'daemon off;'"
      ]
    }
  ])
}

# ECS Service
resource "aws_ecs_service" "nginx" {
  name            = "${var.app_name}-nginx-service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.nginx.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets          = var.subnet_ids            # Phải là private subnet (nếu dùng NAT) hoặc public (nếu assign IP)
    security_groups  = [var.security_group_id]
    assign_public_ip = true                      # true nếu dùng public subnet
  }

  # Không còn cần depends_on ASG vì không dùng EC2 nữa
  # depends_on = [aws_autoscaling_group.ecs_asg]
}

# ==========================================

# ecs_task_execution_role = ecs_TER
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "${var.app_name}-task-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      },
      Effect = "Allow",
      Sid    = ""
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_logs_TER" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy_attachment" "s3_attach_ecs_TER" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

