resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_instance_type
  availability_zone = var.ec2_availbilty_zone
  
  
user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install apache2 -y
              sudo systemct1 start apache2
              sudo bash -c 'echo your first web server > /var/www/html/index.html'
              EOF

  network_interface {
    device_index = 0
    network_interface_id = var.n_i_d
  }


  tags = {
    Name = var.ec2_tag_name
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical

  tags = {
    Name = var.ec2_ami_tag_name
    
  }

}


