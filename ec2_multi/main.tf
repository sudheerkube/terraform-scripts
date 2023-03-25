# Get Availability Zones
resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Generate a Private Key and encode it as PEM.
resource "aws_key_pair" "key_pair" {
  key_name   = "key"
  public_key = tls_private_key.key.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.key.private_key_pem}' > ./key.pem"
  }
}
resource "local_file" "tf-key" {
  content  = tls_private_key.key.private_key_pem
  filename = "key.pem"
}

# Define Variable Instances For Module

 # variable "instances" {}

# Create Mutliple Instances

# variable "instance_user_data_file" {
#   type    = map(string)
#   default = {
#     "maven-instance-0" = "user_data1.sh",
#     "nexus-instance-1" = "user_data1.sh",
#     "jenkins-instance-2" = "user_data1.sh",
#   }
# }

# locals {
#   instance_user_data = {
#     for instance_name, user_data_file in var.instance_user_data_file :
#     instance_name => file(user_data_file)
#   }
# }

# variable "instances" {}

variable "instances" {
  default = {
    "maven-instance-0" = {
      instance_type = "t2.micro"
      count         = 1
      user_data     = "./user_data1.sh"
    },
    "nexus-instance-1" = {
      instance_type = "t3.small"
      count         = 1
      user_data     = "./user_data2.sh"
    },
    "jenkins-instance-2" = {
      instance_type = "t2.medium"
      count         = 1
      user_data     = "./user_data3.sh"
    }
  }
}

# Create a EC2 Instance (Ubuntu 20)
resource "aws_instance" "node" {
  for_each               = var.instances
  instance_type          = each.value.instance_type # free instance
  ami                    = "ami-0f8ca728008ff5af4" #"ami-0caf778a172362f1c"
  key_name               = aws_key_pair.key_pair.id
  vpc_security_group_ids = [var.public_sg]
  subnet_id              = var.public_subnet
  user_data              = each.value.user_data
  #user_data              = local.instance_user_data[each.key]
  #user_data              = var.instance_user_data_file
  tags = {
    Name = each.key
  }

  # user_data = file("${path.root}/ec2/userdata.tpl")

  root_block_device {
    volume_size = 10
  }
}

# Create and assosiate an Elastic IP
resource "aws_eip" "eip" {
  for_each = var.instances
  #VPC = true
}

resource "aws_eip_association" "elastic_ip_association" {
  for_each = var.instances

  instance_id   = aws_instance.node[each.key].id
  allocation_id = aws_eip.eip[each.key].id
}

