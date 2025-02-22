variable "ami_id" {
  description = "The AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type"
  type        = string
}

variable "key_name" {
  description = "The key pair name"
  type        = string
}

variable "public_subnet_id_1" {
  description = "The first public subnet ID"
  type        = string
}

variable "public_subnet_id_2" {
  description = "The second public subnet ID"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID"
  type        = string
}

variable "frontend_user_data" {
  description = "User data script for the frontend server"
  type        = string
}

variable "backend_user_data" {
  description = "User data script for the backend server"
  type        = string
}


