# # resource "aws_instance" "temp_server_1" {
# #   ami             = var.ami_id
# #   instance_type   = var.instance_type
# #   subnet_id       = var.public_subnet_id_1
# #   security_groups = [var.security_group_id]
# #   key_name        = var.key_name
# #   associate_public_ip_address = true
# #   user_data = base64encode(file("${path.module}/1.sh"))  # Pass the script


# #   tags = {
# #     Name = "Temp-Server-1"
# #   }
# # }

# # resource "aws_instance" "temp_server_2" {
# #   ami             = var.ami_id
# #   instance_type   = var.instance_type
# #   subnet_id       = var.public_subnet_id_2
# #   security_groups = [var.security_group_id]
# #   key_name        = var.key_name
# #   associate_public_ip_address = true
# #   user_data = base64encode(file("${path.module}/2.sh"))  # Pass the script

# #   tags = {
# #     Name = "Temp-Server-2"
# #   }
# # }

# resource "aws_instance" "temp_frontend_server_1" {
#   ami                         = var.ami_id
#   instance_type               = var.instance_type
#   subnet_id                   = var.subnet_id
#   key_name                    = var.key_name
#   associate_public_ip_address = true

#   user_data = file("${path.module}/${var.frontend_user_data}")

#   tags = {
#     Name = "temp-frontend-server-1"
#   }
# }

# resource "aws_instance" "temp_backend_server_2" {
#   ami                         = var.ami_id
#   instance_type               = var.instance_type
#   subnet_id                   = var.subnet_id
#   key_name                    = var.key_name
#   associate_public_ip_address = true

#   user_data = file("${path.module}/${var.backend_user_data}")

#   tags = {
#     Name = "temp-backend-server-2"
#   }
# }

# resource "aws_instance" "temp_frontend" {
#   ami           = var.ami_id
#   instance_type = var.instance_type
#   subnet_id     = var.public_subnet_id_1
#   security_groups = [var.security_group_id]
#   key_name      = var.key_name
#   associate_public_ip_address = true
#   user_data = file("${path.module}/${var.frontend_user_data}")

# }

# resource "aws_instance" "temp_backend" {
#   ami           = var.ami_id
#   instance_type = var.instance_type
#   subnet_id     = var.public_subnet_id_2
#   security_groups = [var.security_group_id]
#   key_name      = var.key_name
#   associate_public_ip_address = true

#   user_data = file("${path.module}/${var.backend_user_data}")

# }

resource "aws_instance" "temp_frontend" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id_1
  security_groups = [var.security_group_id]
  key_name      = var.key_name
  user_data     = file("${path.module}/${var.frontend_user_data}")
}

resource "aws_instance" "temp_backend" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id_2
  security_groups = [var.security_group_id]
  key_name      = var.key_name
  user_data     = file("${path.module}/${var.backend_user_data}")
}

