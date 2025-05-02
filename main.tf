module network {
    source = "./modules/network"
}

module "app_server" {
    for_each = { for s in var.app_servers : s.name => s }
    source = "./modules/ec2"
    name = each.value.name
    instance_type = each.value.instance_type
    ebs_size = each.value.ebs_size
    subnet_id = module.network.subnet_id
    security_group_id = module.network.security_group_id
    key_name = var.key_name

    user_data = <<-EOF
        #!/bin/bash
        useradd appuser1
        yum install -y tomcat
        systemctl enable tomcat
        systemctl start tomcat
    EOF
}

module "db_servers" {
    for_each = { for s in var.db_serevrs : s.name => s }
    source = "./modules/ec2"
    name = each.value.name
    instance_type = each.value.instance_type
    ebs_size = each.value.ebs_size
    subnet_it = module.network.subnet_id
    security_group_id = module.security_group_id
    key_name = var.key_name

    user_data = <<-EOF
        #!/bin/bash
        useradd dbuser1
        useradd dbuser2
    EOF
}

resource "aws_key_pair" "my_key" {
  key_name   = "my-ssh-key"
  public_key = file("~/.ssh/id_rsa.pub")  
}