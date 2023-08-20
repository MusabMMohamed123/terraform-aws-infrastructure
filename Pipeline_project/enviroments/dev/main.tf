



module "new_vpc" {
  source = "../../modules/vpc_module"

  vpc_cidr_block                      = var.vpc_cidr_block
  vpc_tag                             = var.vpc_tag
  cidr_block_route                    = var.cidr_block_route
  cidr_block_ip6_route                = var.cidr_block_ip6_route
  internet_gateway_tag                = var.internet_gateway_tag
  route_table_tag                     = var.route_table_tag
  subnet_cidr_block                   = var.subnet_cidr_block
  subnet_availblity_zone              = var.subnet_availblity_zone
  subnet_tag                          = var.subnet_tag
  security_group_ingress_description  = var.security_group_ingress_description
  security_group_ingress_from_port    = var.security_group_ingress_from_port
  security_group_ingress_to_port      = var.security_group_ingress_to_port
  security_group_ingress_protocol     = var.security_group_ingress_protocol
  security_group_cidr_block           = ["0.0.0.0/0"]
  security_group_ip6_cidr_block       = ["::/0"]
  security_group_ingress2_description = var.security_group_ingress2_description
  security_group_ingress2_from_port   = var.security_group_ingress2_from_port
  security_group_ingress2_to_port     = var.security_group_ingress2_to_port
  security_group_ingress3_description = var.security_group_ingress3_description
  security_group_ingress3_from_port   = var.security_group_ingress3_from_port
  security_group_ingress3_to_port     = var.security_group_ingress3_to_port
  security_group_egress_from_port     = var.security_group_egress_from_port
  security_group_egress_to_port       = var.security_group_egress_to_port
  security_group_egress_protocol      = var.security_group_egress_protocol
  security_group_tag_name             = var.security_group_tag_name
  ec2_instance_web                    = module.new_ec2_instance.ec2_instance
}

module "new_ec2_instance" {
  source = "../../modules/ec2_module"

  ec2_instance_type   = var.ec2_instance_type
  ec2_tag_name        = var.ec2_tag_name
  ec2_availbilty_zone = var.ec2_availbilty_zone
  ec2_ami             = var.ec2_ami
  ec2_ami_tag_name    = var.ec2_ami_tag_name
  number_of_instances = var.number_of_instances
  n_i_d               = module.new_vpc.networkinterface-id
  SUBNET_ID           = module.new_vpc.subnet_id
}

