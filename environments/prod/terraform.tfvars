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
db_name           = "dbprod"
username          = "admin-test"
password          = "passwordtest"
multi_az          = true
db_subnet_group_name = "prod-db-subnet-group"

tags = {
  Environment = "prod"
  Project     = "example"
  Owner       = "team-name"
}

security_group_ids = ["a", "b"]

ingress_rules = [
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

aws_region = "us-east-1"