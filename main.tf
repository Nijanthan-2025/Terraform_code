module network {
    source = "./modules/network"
}

locals {
    app_servers = [
        { name = "app_server-1", instance_type = "t3.micro", ebs_size = 1 },
        { name = "app_server-2", instance_type = "t3.micro", ebs_size = 1 }
    ]
}

locals {
    db_serevrs = [
        { name = "db_server-1", instance_type = "t3.micro", ebs_size = 1 },
        { name = "db_server-2", instance_type = "t3.micro", ebs_size = 1 }
    ]
}

module "app_server" {
    for_each = { for s in local.app_servers : s.name => s }
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
    for_each = { for s in local.db_serevrs : s.name => s }
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