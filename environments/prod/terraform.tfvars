instance_count = 2
frontend_ami   = "ami-0427090fd1714168b"
backend_ami    = "ami-0427090fd1714168b"
instance_type  = "t2.micro"
key_name       = "key-test"

vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]

allocated_storage = 20
engine            = "mysql"
instance_class    = "db.t3.micro"
db_name           = "db-prod"
username          = "admin"
password          = "password"
multi_az          = true
db_subnet_group_name = "prod-db-subnet-group"

tags = {
  Environment = "prod"
  Project     = "example"
  Owner       = "team-name"
}

security_group_ids = ["a", "b"]