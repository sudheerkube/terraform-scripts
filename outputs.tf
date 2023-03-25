# Single Instance output
output "ec2_public_dns" {
  
 value = module.ec2.ec2_public_dns
}

output "ec2_public_ip" {
 value = module.ec2.ec2_public_ip
}

# Multi Instance outputs 

# output "my_ec2_instance_public_ips" {
#   value = module.ec2_multi.ec2_instance_public_ips
# }

# output "eips" {
#   value = module.ec2_multi.eips
# }