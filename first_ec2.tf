provider "aws" {
  region     = "us-west-1"
  access_key = "AKIAWGECS2XHMCU55TBM"
  secret_key = "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"
}

module "tf_ec2" {
  source = "./modules/ec2"
  //instance_type = "t2.large"
}


resource "aws_eip" "my_epi" {
  instance = module.tf_ec2.ec2_output.id
  //tf_ec2.id
}

/* resource "aws_security_group" "dynamic_security_group" {
  dynamic "ingress" {
    for_each = var.ingress_ports
    iterator = port
    content {
      from_port = port.value
      to_port = port.value
      cidr_blocks = ["${aws_eip.my_epi.private_ip}/32"]
      protocol = "tcp"
    }
  }
}
 */
