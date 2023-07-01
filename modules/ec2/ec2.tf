data "aws_ami" "my_ami" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "tf_ec2" {
  ami           = data.aws_ami.my_ami.id
  instance_type = lookup(var.instance_type, terraform.workspace)
  tags = {
    Name = local.tagName
  }
}

output "ec2_output" {
  value = aws_instance.tf_ec2
}

locals {
  tagName = "terraform_ec2"
}