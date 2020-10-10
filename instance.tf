
data "aws_subnet" "subnet" {
  id = var.subnet_id
}

locals {
  single_instance_fqn = "ec2-${data.aws_subnet.subnet.availability_zone}-${var.instance_name}"
}

# create a single EC2 instance
resource "aws_instance" "single" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = data.aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.default.id]
  root_block_device {
    delete_on_termination = true
    volume_size = var.root_volume_size
    volume_type = "gp2"
  }
  ebs_block_device {
    delete_on_termination = true
    device_name = "/dev/xvdb"
    volume_size = var.data_volume_size
    volume_type = "gp2"
  }
  tags = merge(map(
  "Name", local.single_instance_fqn
  ), local.main_common_tags)
}

