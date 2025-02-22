terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


provider "aws" {
   region = "us-east-1"
 }

# Module: Networking (VPC, Subnets, IGW, NAT)
module "network" {
  source = "./modules/network"
  availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1a", "us-east-1b", "us-east-1a", "us-east-1b"]  # ✅ Added this line


  private_subnet_cidrs = [
    "170.20.3.0/24",
    "170.20.4.0/24",
    "170.20.5.0/24",
    "170.20.6.0/24",
    "170.20.7.0/24",
    "170.20.8.0/24"
  ]
}



# # Module: Security Groups
module "security_group" {
  source              = "./modules/security"
  vpc_id             = module.network.vpc_id
  sg_name            = "main-security-group"
  ingress_from_port  = 0
  ingress_to_port    = 0
  ingress_protocol   = "-1"
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_from_port   = 0
  egress_to_port     = 0
  egress_protocol    = "-1"
  egress_cidr_blocks = ["0.0.0.0/0"]
}
# output "security_group_id" {
#   value = module.security_group.security_group_id
# }


module "rds" {
  source               = "./modules/rds"
  db_identifier        = "app-db"
  db_engine           = "mysql"
  db_instance_class   = "db.t3.micro"
  db_allocated_storage = 20
  db_name             = "test"
  db_username         = "admin"
  db_password         = "password123"  # Consider using AWS Secrets Manager
  db_security_group_id = module.security_group.security_group_id
  db_subnet_ids       = [module.network.private_subnet_ids[4], module.network.private_subnet_ids[5]]  # ✅ Fixed Reference
}



# # Module: Load Balancers
module "alb" {
  source            = "./modules/load_balancers"
  frontend_alb_name = "frontend-alb"
  backend_alb_name  = "backend-alb"
  security_group_id = module.security_group.security_group_id
  public_subnet_ids = [module.network.public_subnet_ids[1], module.network.public_subnet_ids[0]]
  frontend_tg_name  = "frontend-tg"
  backend_tg_name   = "backend-tg"
  vpc_id            = module.network.vpc_id
}
module "launch_templates" {
  source              = "./modules/launch_templates"
  frontend_lt_name    = "frontend-lt"
  backend_lt_name     = "backend-lt"
  key_name            = "ramanikey"
  ami_id_frontend     = "ami-0c74c875f4df01539"
  ami_id_backend      = "ami-028bea3d2aaaef497"
  instance_type       = "t2.micro"
  frontend_user_data  = "frontend.sh"
  backend_user_data   = "backend.sh"
  security_group_id   = module.security_group.security_group_id
}


module "autoscaling" {
  source               = "./modules/asg"
  frontend_asg_name    = "frontend-asg"
  backend_asg_name     = "backend-asg"
  asg_min_size         = 1
  asg_max_size         = 3
  asg_desired_capacity = 1
  frontend_subnet_ids  = [module.network.private_subnet_ids[0], module.network.private_subnet_ids[1]]
  backend_subnet_ids   = [module.network.private_subnet_ids[2], module.network.private_subnet_ids[3]]
  frontend_tg_arn      = module.alb.frontend_tg_arn
  backend_tg_arn       = module.alb.backend_tg_arn
  frontend_lt_id        =  module.launch_templates.frontend_lt_id
  backend_lt_id = module.launch_templates.backend_lt_id

}

module "bastion" {
  source            = "./modules/bastion"
  ami_id            = "ami-04b4f1a9cf54c11d0"
  instance_type     = "t2.micro"
  key_name          = "ramanikey"
  public_subnet_id  = module.network.public_subnet_ids[0]
  security_group_id = module.security_group.security_group_id
}

module "route53" {
  source              = "./modules/route53"
  vpc_id              = module.network.vpc_id
  rds_endpoint        = module.rds.rds_endpoint
  alb_dns_name        = module.alb.alb_backend_dns
}

module "acm" {
  source      = "./modules/acm"
  domain_name = "b15facebook.xyz"
  san_names   = ["*.b15facebook.xyz"]
}

output "acm_certificate_arn" {
  value = module.acm.acm_certificate_arn
}

module "godaddy_dns" {
  source            = "./modules/godaddy_dns"
  godaddy_api_key   = "KMNW3QZRJjs8gfKMtabXt8"
  godaddy_api_secret = "gHVdeySgchGc_5MwbpGtSgMviHDKHFNJQq5"
  domain_name       = "b15facebook.xyz"
  route53_zone_id   = module.route53.public_zone_id
}
