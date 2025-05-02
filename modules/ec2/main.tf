resource "aws_instance" "app_db" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name

  root_block_device {
    volume_size = var.ebs_size
    volume_type = "gp2"
  }

  tags = {
    Name = var.name
  }
}
