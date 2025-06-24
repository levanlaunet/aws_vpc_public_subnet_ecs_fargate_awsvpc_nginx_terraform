
output "app_sg_id" {
  value = aws_security_group.app_sg.id
}

output "db_postgres_sg_id" {
  value = aws_security_group.rds_postgres_sg.id
}