vpc_name           = "my-vpc"
cidr_block         = "10.0.0.0/16"
availability_zones = ["ap-southeast-1a", "ap-southeast-1b"]
public_subnet_ips  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_ips = ["10.0.101.0/24", "10.0.102.0/24"]
region             = "ap-southeast-1"
key_pair_path = "./keypair/ec2_demo_key.pub"
key_pair_name = "ec2_demo_key_pair_1"
instance_type = "t2.micro"
instance_name = "ec2_demo_instance_1"
public_sg_name = "public_security_group_1"
public_sg_description = "public_security_group_dec_1"
private_sg_name = "private_security_group_1"
private_sg_description = "private_security_group_dec_1"
# 
environment = "dev"
app_name = "MyApp"
ssm_instance_type = "t2.micro"
ssm_instance_name = "ssm_ec2_instance_my"
# 
enable_ssm_endpoints = false
os_type = "amazon_linux_2023"
profile_aws_cli = "default" #default
# 
db_instance_name      = "my-instance-postgres"
db_name               = "my_db_postgres"
db_engine_version     = "17.5" #https://docs.aws.amazon.com/AmazonRDS/latest/PostgreSQLReleaseNotes/postgresql-release-calendar.html
db_instance_class     = "db.t3.micro"
db_allocated_storage  = 20
db_username           = "my_username_postgres"
db_password           = "my_password_postgres"
# 
cluster_name = "MyCluster"
