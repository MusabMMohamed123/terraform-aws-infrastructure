variable "vpc_cidr_block" {
  type        = string
  description = "THE VPC CIDR BLOCK"
  default     = "10.0.0.0/16"
}
variable "vpc_tag" {
  type        = string
  description = "THE VPC TAG NAME"
  default     = "This is the default tag name"
}
variable "cidr_block_route" {
  type        = string
  description = "THE IP4 CIDR BLOCK FOR ROUTE TABLE"
  default     = "0.0.0.0/0"

}
variable "cidr_block_ip6_route" {
  type        = string
  description = "THE IP6 CIDR BLOCK FOR ROUTE TABLE "
  default     = "::/0"

}
variable "internet_gateway_tag" {
  type        = string
  description = "THE TAG NAME FOR THE INTERNET GATEWAY"
  default     = "this is the default"

}
variable "route_table_tag" {
  type        = string
  description = "THE TAG NAME FOR THE ROUTE TABLE"
  default     = "this is the default"

}
variable "subnet_cidr_block" {
  type        = string
  description = "THE CIDR BLOCK FOR THE SUBNET"
  default     = "10.0.2.0/24"

}
variable "subnet_availblity_zone" {
  type        = string
  description = "THE AVAILIBILTY ZONE FOR THE SUBNET"
  default     = "us-east-1a"

}
variable "subnet_tag" {
  type        = string
  description = "THE TAG NAME FOR THE SUBNET"
  default     = "value"

}
variable "security_group_ingress_description" {
  type        = string
  description = "THE APPLICATION LAYER PROTOCOL FOR PORT 443"
  default     = "HTTPS"

}
variable "security_group_ingress_from_port" {
  type        = number
  description = "THE HTTPS PORT NUMBER"
  default     = 443

}
variable "security_group_ingress_to_port" {
  type        = number
  description = "THE HTTPS PORT NUMBER"
  default     = 443

}
variable "security_group_ingress_protocol" {
  type        = string
  description = "THE TRANSPORT LAYER PROTOCOL"
  default     = "tcp"
}
variable "security_group_cidr_block" {
  type        = string
  description = "THE IP4 RANGE THAT CAN USE MY APPLICATION"
  default     = "0.0.0.0/0"

}
variable "security_group_ip6_cidr_block" {
  type        = string
  description = "THE IP6 RANGE THAT CAN USE MY APPLICATION"
  default     = "value"

}
variable "security_group_ingress2_description" {
  type        = string
  description = "THE APPLICATION LAYER PROTOCOL FOR PORT 80"
  default     = "HTTP"

}

variable "security_group_ingress2_from_port" {
  type        = number
  description = "THE PORT NUMBER FOR HTTP"
  default     = 80

}
variable "security_group_ingress2_to_port" {
  type        = number
  description = "THE PORT NUMBER FOR HTTP"
  default     = 80

}
variable "security_group_ingress3_description" {
  type        = string
  description = "THE APPLICATION PROTOCOL FOR PORT 22"
  default     = "ssh"

}

variable "security_group_ingress3_from_port" {
  type        = number
  description = "THE SSH PORT NUMBER"
  default     = 22

}
variable "security_group_ingress3_to_port" {
  type        = number
  description = "THE SSH PORT NUMBER"
  default     = 22

}

variable "security_group_egress_from_port" {
  type        = number
  description = "ALL PORTS CAN EGRESS"
  default     = 0

}
variable "security_group_egress_to_port" {
  type        = number
  description = "ALL PORTS CAN EGRESS"
  default     = 0

}
variable "security_group_egress_protocol" {
  type        = string
  description = "ALL PROTOCOLS CAN BE USED"
  default     = "-1"
}

variable "security_group_tag_name" {
  type        = string
  description = "THE TAG NAME FOR THE SECURITY GROUP"
  default     = "THIS IS THE DEFAULT"
}

variable "ec2_instance_type" {
  type        = string
  description = "THE TYPE OF INSTANCE"
  default     = "t2.micro"
}
variable "ec2_tag_name" {
  type        = string
  description = "THE TAG NAME FOR THE INSTANCE"
  default     = "THIS IS THE DEFAULT"
}
variable "ec2_availbilty_zone" {
  type        = string
  description = "THE AVAILIBILTY ZONE FOR THE INSTANCE"
  default     = "us-east-1a"
}
variable "ec2_ami" {
  type        = string
  description = "THE AMI FOR THE INSTANCE"
  default     = "ami-0fc682b2a42e57ca2"
}
variable "ec2_ami_tag_name" {
  type        = string
  description = "THE TAG NAME FOR THE AMI"
  default     = "this the default"
}
variable "number_of_instances" {
  type        = number
  description = "THE NUMBER OF INSTANCES"
  default     = 1

}

variable "aws_s3_bucket" {
  type = string
  default = "musab-aws-pipeline-project5343"
  validation {
    condition     = can(regex("^([a-z0-9]{1}[a-z0-9-]{1,61}[a-z0-9]{1})$", var.aws_s3_bucket))
    error_message = "Bucket Name must not be empty and must follow S3 naming rules."
  }
}