# # variable "instances" {
# #   default = {
# #     "maven-instance-0" = {
# #       instance_type = "t2.micro"
# #       count         = 1
# #       user_data     = "./user_data1.sh"
# #     },
# #     "nexus-instance-1" = {
# #       instance_type = "t3.small"
# #       count         = 1
# #       user_data     = "./user_data2.sh"
# #     },
# #     "jenkins-instance-2" = {
# #       instance_type = "t2.medium"
# #       count         = 1
# #       user_data     = "./user_data3.sh"
# #     }
# #   }
# # }
# # New Code

# variable "instances" {
#   type = map(object({
#     ami           = string
#     instance_type = string
#     user_data     = string
#   }))
# }

# locals {
#   user_data_file1 = file("${path.module}/user_data1.sh")
#   user_data_file2 = file("${path.module}/user_data2.sh")
#   user_data_file3 = file("${path.module}/user_data3.sh")

#   instances = {
#     "maven-instance-0" = {
#       ami           = "ami-0f8ca728008ff5af4"
#       instance_type = "t2.micro"
#       user_data     = local.user_data_file1
#     },
#     "nexus-instance-1" = {
#       ami           = "ami-0f8ca728008ff5af4"
#       instance_type = "t2.small"
#       user_data     = local.user_data_file2
#     },
#      "jenkins-instance-2" = {
#       ami           = "ami-0f8ca728008ff5af4"
#       instance_type = "t2.medium"
#       user_data     = local.user_data_file2
#     },
#   }
# }