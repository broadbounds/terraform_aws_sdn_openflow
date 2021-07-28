output "bastion_host_public_ip" {  
  value = "${aws_eip.bastion_elastic_ip.public_ip}"
}

output "bastion_host_private_ip" {  
  value = "${aws_eip.bastion_elastic_ip.private_ip}"
}

