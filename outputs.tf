output "management_public_ip" {
  value = aws_instance.management.public_ip
}

output "master_public_ips" {
  value = aws_instance.masters[*].public_ip
}

output "worker_public_ips" {
  value = aws_instance.workers[*].public_ip
}
