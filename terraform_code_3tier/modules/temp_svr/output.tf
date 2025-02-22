# # output "temp_server_1_id" {
# #   description = "ID of the first temporary server"
# #   value       = aws_ami_from_instance.frontend_ami
# # }

# # output "temp_server_2_id" {
# #   description = "ID of the second temporary server"
# #   value       = aws_ami_from_instance.backend_ami
# # }
# output "frontend_ami_id" {
#   value       = aws_ami_from_instance.frontend_ami.id
#   description = "Frontend AMI ID"
# }

# output "backend_ami_id" {
#   value       = aws_ami_from_instance.backend_ami.id
#   description = "Backend AMI ID"
# }
# output "temp_server_1_id" {
#   value       = aws_instance.temp_frontend_server_1.id
#   description = "ID of the first temporary frontend server"
# }

# output "temp_server_2_id" {
#   value       = aws_instance.temp_backend_server_2.id
#   description = "ID of the second temporary backend server"
# }



# output "temp_server_1_public_ip" {
#   description = "Public IP of the first temporary server"
#   value       = aws_instance.temp_server_1.public_ip
# }

# output "temp_server_2_public_ip" {
#   description = "Public IP of the second temporary server"
#   value       = aws_instance.temp_server_2.public_ip
# }
output "frontend_ami_id" {
  value       = aws_ami_from_instance.frontend_ami.id
  description = "AMI ID of the frontend server"
}

output "backend_ami_id" {
  value       = aws_ami_from_instance.backend_ami.id
  description = "AMI ID of the backend server"
}

