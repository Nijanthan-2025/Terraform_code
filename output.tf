output "app_instance_ips" {
    value = {
        for name, instance in module.app_servers :
        name => {
            public_ip = instance.public_ip
            private_ip = instance.private_ip
        }
    }
}

output "db_instance_ips" {
    value = {
        for each, instance in modue.db_servers :
        name => {
            public_ip = instance.public_ip
            private_ip = instance.private_ip
        }
    }
}