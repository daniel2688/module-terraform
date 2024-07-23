instance_count = 2
frontend_ami   = "ami-0abcdef1234567890"
backend_ami    = "ami-0abcdef1234567890"
instance_type  = "t2.micro"
key_name       = "my-key-pair"



vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]
tags = {
  Environment = "dev"
  Project     = "example"
  Owner       = "team-name"
}

allocated_storage = 20
engine            = "mysql"
instance_class    = "db.t3.micro"
name              = "devdb"
username          = "admin"
password          = "password"
multi_az          = false
db_subnet_group_name = "dev-db-subnet-group"

