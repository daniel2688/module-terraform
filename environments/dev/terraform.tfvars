aws_region           = "us-east-1"
front_instance_count = 2
back_instance_count  = 2
frontend_ami         = "ami-0427090fd1714168b"
backend_ami          = "ami-0427090fd1714168b"
front_instance_type  = "t2.micro"
back_instance_type   = "t2.micro"
public_key_name      = "public-key"
private_key_name     = "private-key"

vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]

allocated_storage    = 20
engine               = "mysql"
instance_class       = "db.t3.micro"
db_name              = "dbdev"
username             = "admin"
password             = "password"
multi_az             = false
db_subnet_group_name = "dev-db-subnet-group"

tags = {
  Environment = "dev"
  Project     = "example"
  Owner       = "team-name"
}

# Reglas para el frontend
ingress_rules_frontend = [
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

egress_rules_frontend = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

# Reglas para el backend
ingress_rules_backend = [
  {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

egress_rules_backend = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

# Reglas para la base de datos
ingress_rules_database = [
  {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

egress_rules_database = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]