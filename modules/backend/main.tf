resource "aws_instance" "backend" {
  count                    = var.instance_count
  ami                      = var.ami
  instance_type            = var.instance_type
  key_name                 = var.key_name
  subnet_id                = var.subnet_ids[count.index]
  vpc_security_group_ids   = var.security_group_ids
  associate_public_ip_address = false

  tags = merge(
    var.tags,
    { Name = "backend-instance-${count.index}" }
  )

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y nodejs npm
              mkdir -p /var/www/backend
              echo 'console.log("Hello from Backend");' > /var/www/backend/app.js
              node /var/www/backend/app.js &
              EOF
}
