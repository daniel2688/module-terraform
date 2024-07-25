resource "aws_instance" "backend" {
  count                    = var.instance_count
  ami                      = var.backend_ami
  instance_type            = var.instance_type
  key_name                 = var.key_name
  subnet_id                = element(var.subnet_ids, count.index)
  vpc_security_group_ids   = var.security_group_ids
  associate_public_ip_address = true

  tags = merge(
    var.tags,
    { Name = "backend-instance-${count.index}" }
  )
}
