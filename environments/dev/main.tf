provider "aws" {
  region     = var.aws_region
}

module "networking" {
  source = "../../modules/networking"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  tags                 = var.tags
}

module "frontend" {
  source = "../../modules/frontend"

  instance_count      = var.instance_count
  frontend_ami        = var.frontend_ami
  instance_type       = var.instance_type
  key_name            = var.key_name
  subnet_ids          = module.networking.public_subnet_ids  # Usa el output del módulo networking
  security_group_ids  = [module.networking.frontend_sg_id]  # Usa el output del módulo networking
  tags                = var.tags
}

module "backend" {
  source = "../../modules/backend"

  instance_count      = var.instance_count
  backend_ami         = var.backend_ami  # Usa la variable backend_ami
  instance_type       = var.instance_type
  key_name            = var.key_name
  subnet_ids          = module.networking.private_subnet_ids  # Usa el output del módulo networking
  security_group_ids  = [module.networking.backend_sg_id]  # Usa el output del módulo networking
  tags                = var.tags
}

module "database" {
  source = "../../modules/database"

  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  instance_class         = var.instance_class
  db_name                = var.db_name
  username               = var.username
  password               = var.password
  multi_az               = var.multi_az
  db_subnet_group_name   = var.db_subnet_group_name
  subnet_ids             = module.networking.private_subnet_ids  # Usa el output del módulo networking
  security_group_ids     = [module.networking.database_sg_id]  # Usa el output del módulo networking
  tags                   = var.tags
}
