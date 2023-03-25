#output "ec2_public_dns" {
#  value = aws_instance.node.public_dns
#}

#output "ec2_public_ip" {
#  value = aws_eip.eip.public_ip
#}

#output "instance_elastic_ips" {
#  value = {
#    for k, v in aws_instance.node : k => aws_eip_association.elastic_ip_association[k].public_ip
#  }
#}

output "ec2_instance_public_ips" {
  value = { for idx, instance in aws_instance.node : "instance-${idx}" => instance.public_ip }
}

#New Code

output "eips" {
  value = {
    for node, eip in aws_eip.eip :
    node => eip.public_ip
  }
}
#output "instance_public_ips" {
#  value = [for _, eip in aws_eip_association.elastic_ip_association : eip.public_ip]
#}
