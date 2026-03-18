output "app_ip" {
  value = aws_eip.app_eip.public_ip
}

output "db_ip" {
  value = aws_instance.db.public_ip
}

output "monitoring_ip" {
  value = aws_instance.monitoring.public_ip
}
