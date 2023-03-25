variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}

variable "access_ip" {
  type = string
}

variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

# variable "instances" {
#   default = {
#     "maven-instance-0" = {
#       instance_type = "t2.micro"
#       count         = 1
#       #user_data     = "${file("user_data1.sh")}"
#     },
#     "nexus-instance-1" = {
#       instance_type = "t3.small"
#       count         = 1
#       #user_data     = "./user_data2.sh"
#     },
#     "jenkins-instance-2" = {
#       instance_type = "t2.medium"
#       count         = 1
#       #user_data     = "./user_data3.sh"
#     }
#   }
# }

# variable "instance_user_data_file" {
#   type    = map(string)
#   default = {
#     "maven-instance-0" = "user_data1.sh",
#     "nexus-instance-1" = "user_data2.sh",
#     "jenkins-instance-2" = "user_data3.sh",
#   }
# }

# locals {
#   instance_user_data = {
#     for instance_name, user_data_file in var.instance_user_data_file :
#     instance_name => file(user_data_file)
#   }
# }

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

# # variable "instances" {}

# variable "instances" {
#   default = {
#     "maven-instance-0" = {
#       instance_type = "t2.micro"
#       count         = 1
#       #user_data     =  var.instance_user_data
#     },
#     "nexus-instance-1" = {
#       instance_type = "t3.small"
#       count         = 1
#       #user_data     =  var.instance_user_data
#     },
#     "jenkins-instance-2" = {
#       instance_type = "t2.medium"
#       count         = 1
#       #user_data    =  var.instance_user_data
#     }
#   }
# }
