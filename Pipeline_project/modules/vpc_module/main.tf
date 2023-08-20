#create vpc

resource "aws_vpc" "server_12" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_tag
  }
}

#create internet gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.server_12.id

  tags = {
    Name = var.internet_gateway_tag
  }
}

#create egress only internet gateway

resource "aws_egress_only_internet_gateway" "new_eoig" {
  vpc_id = "${aws_vpc.server_12.id}"
}

#create route table

resource "aws_route_table" "server_12" {
  vpc_id = aws_vpc.server_12.id

  route {
    cidr_block = var.cidr_block_route
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block        = var.cidr_block_ip6_route
    egress_only_gateway_id = aws_egress_only_internet_gateway.new_eoig.id
  }

  tags = {
    Name = var.route_table_tag
  }
}

#create a subnet 

resource "aws_subnet" "server_12" {
  vpc_id            = aws_vpc.server_12.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.subnet_availblity_zone


  tags = {
    Name = var.subnet_tag
  }
}

#associate subnet with route table

resource "aws_route_table_association" "server_12" {
  subnet_id      = aws_subnet.server_12.id
  route_table_id = aws_route_table.server_12.id
}

#create a security group

resource "aws_security_group" "allow_web_" {
  name        = "allow_web_traffic"
  description = "Allow Web inbound traffic"
  vpc_id      = aws_vpc.server_12.id


  ingress {
    description      = var.security_group_ingress_description
    from_port        = var.security_group_ingress_from_port
    to_port          = var.security_group_ingress_to_port
    protocol         = var.security_group_ingress_protocol
    cidr_blocks      = var.security_group_cidr_block
    ipv6_cidr_blocks = var.security_group_ip6_cidr_block
  }
  ingress {
    description      = var.security_group_ingress2_description
    from_port        = var.security_group_ingress2_from_port
    to_port          = var.security_group_ingress2_to_port
    protocol         = var.security_group_ingress_protocol
    cidr_blocks      = var.security_group_cidr_block
    ipv6_cidr_blocks = var.security_group_ip6_cidr_block
  }
  ingress {
    description      = var.security_group_ingress3_description
    from_port        = var.security_group_ingress3_from_port
    to_port          = var.security_group_ingress3_to_port
    protocol         = var.security_group_ingress_protocol
    cidr_blocks      = var.security_group_cidr_block
    ipv6_cidr_blocks = var.security_group_ip6_cidr_block
  }
  egress {
    from_port        = var.security_group_egress_from_port
    to_port          = var.security_group_egress_to_port
    protocol         = var.security_group_egress_protocol
    cidr_blocks      = var.security_group_cidr_block
    ipv6_cidr_blocks = var.security_group_ip6_cidr_block
  }

  tags = {
    Name = var.security_group_tag_name
  }
}


#create network interface 

resource "aws_network_interface" "new-1" {
  subnet_id       = aws_subnet.server_12.id
  private_ips     = ["10.0.2.100"]
  security_groups = [aws_security_group.allow_web_.id]

 
}




resource "aws_eip" "elastic-1" {
  domain                    = "vpc"
  network_interface         = aws_network_interface.new-1.id
  associate_with_private_ip = "10.0.2.100"
  depends_on = [ aws_internet_gateway.gw, var.ec2_instance_web]
  
}