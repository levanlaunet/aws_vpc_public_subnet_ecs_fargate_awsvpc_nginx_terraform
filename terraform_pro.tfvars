vpc_name           = "pro-vpc"
cidr_block         = "..."
availability_zones = ["...", "..."]
public_subnet_ips  = ["...", "..."]
private_subnet_ips = ["...", "..."]
region             = "..."
key_pair_path = "..."
key_pair_name = "..."
instance_type = "..."
instance_name = "..."
public_sg_name = "..."
public_sg_description = "..."
private_sg_name = "..."
private_sg_description = "..."
# 
environment = "pro"
app_name = "..."
ssm_instance_type = "..."
ssm_instance_name = "..."
#
enable_ssm_endpoints = false
os_type = "amazon_linux_2"
profile_aws_cli = "default" #default
# 
db_instance_name      = "..."
db_name               = "..."
db_engine_version     = "17.5" #https://docs.aws.amazon.com/AmazonRDS/latest/PostgreSQLReleaseNotes/postgresql-release-calendar.html
db_instance_class     = "db.t3.micro"
db_allocated_storage  = 20
db_username           = "..."
db_password           = "..."
# 
cluster_name = "..."