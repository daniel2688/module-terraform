resource "aws_instance" "frontend" {
  count                    = var.instance_count
  ami                      = var.ami
  instance_type            = var.instance_type
  key_name                 = var.key_name
  subnet_id                = var.subnet_ids[count.index]
  vpc_security_group_ids   = var.security_group_ids
  associate_public_ip_address = true

  tags = merge(
    var.tags,
    { Name = "frontend-instance-${count.index}" }
  )

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF
}
