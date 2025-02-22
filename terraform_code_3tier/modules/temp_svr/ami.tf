# # # Create AMI for Temporary Server 1
# # resource "aws_ami_from_instance" "temp_server_1_ami" {
# #   name               = "temp-server-1-ami-${formatdate("YYYYMMDD", timestamp())}"
# #   source_instance_id = module.temp_servers.temp_server_1_id
# #   description        = "AMI of Temporary Server 1 after setup"
# # }

# # # Create AMI for Temporary Server 2
# # resource "aws_ami_from_instance" "temp_server_2_ami" {
# #   name               = "temp-server-2-ami-${formatdate("YYYYMMDD", timestamp())}"
# #   source_instance_id = module.temp_servers.temp_server_2_id
# #   description        = "AMI of Temporary Server 2 after setup"
# # }
# resource "aws_ami_from_instance" "frontend_ami" {
#   name               = "frontend-ami-${formatdate("YYYYMMDD", timestamp())}"
#   source_instance_id = aws_instance.temp_server_1.id  # ✅ Use local resource, not module reference
#   description        = "AMI of Frontend Server after setup"
# }

# resource "aws_ami_from_instance" "backend_ami" {
#   name               = "backend-ami-${formatdate("YYYYMMDD", timestamp())}"
#   source_instance_id = aws_instance.temp_server_2.id  # ✅ Use local resource, not module reference
#   description        = "AMI of Backend Server after setup"
# }

# resource "aws_ami_from_instance" "frontend_ami" {
#   name               = "frontend-ami-${formatdate("YYYYMMDD", timestamp())}"
#   source_instance_id = aws_instance.temp_frontend_server_1.id
#   description        = "AMI of Frontend Server after setup"
# }

# resource "aws_ami_from_instance" "backend_ami" {
#   name               = "backend-ami-${formatdate("YYYYMMDD", timestamp())}"
#   source_instance_id = aws_instance.temp_backend_server_2.id
#   description        = "AMI of Backend Server after setup"
# }

resource "aws_ami_from_instance" "frontend_ami" {
  name               = "frontend-ami-${formatdate("YYYYMMDD", timestamp())}"
  source_instance_id = aws_instance.temp_frontend_server.id  # Corrected reference
  description        = "AMI of Frontend Server after setup"
}

resource "aws_ami_from_instance" "backend_ami" {
  name               = "backend-ami-${formatdate("YYYYMMDD", timestamp())}"
  source_instance_id = aws_instance.temp_backend_server.id  # Corrected reference
  description        = "AMI of Backend Server after setup"
}
