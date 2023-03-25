locals {
  vpc_cidr = "10.123.0.0/16"
}

locals {
  security_groups = {
    public = {
      name        = "public_sg"
      description = "Security group for Public Access"
      ingress = {
        ssh = {
          from        = 22
          to          = 22
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        http_1 = {
          from        = 8080
          to          = 8080
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        http_2 = {
          from        = 8081
          to          = 8081
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        https = {
          from        = 443
          to          = 443
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
        http_3 = {
          from        = 9000
          to          = 9000
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
         http_3 = {
          from        = 80
          to          = 80
          protocol    = "tcp"
          cidr_blocks = [var.access_ip]
        }
      }
    }
  }
}

# locals {
#   user_data_file1 = file("${path.module}/user_data1.sh")
#   user_data_file2 = file("${path.module}/user_data2.sh")
#   user_data_file3 = file("${path.module}/user_data3.sh")
# }

# locals {
#   instance_user_data = {
#     for instance_name, user_data_file in var.instance_user_data_file :
#     instance_name => file(user_data_file)
#   }
# }