variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
}

variable "front_instance_count" {
  description = "Number of frontend instances to launch"
  type        = number
  default     = 2
}

variable "back_instance_count" {
  description = "Number of backend instances to launch"
  type        = number
  default     = 2
}

variable "frontend_ami" {
  description = "The AMI to use for the frontend instances"
  type        = string
}

variable "backend_ami" {
  description = "The AMI to use for the backend instances"
  type        = string
}

variable "front_instance_type" {
  description = "The type of instance to use for frontend"
  type        = string
}

variable "back_instance_type" {
  description = "The type of instance to use for backend"
  type        = string
}

variable "public_key_name" {
  description = "The key name to use for frontend instances"
  type        = string
}

variable "private_key_name" {
  description = "The key name to use for backend instances"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for the public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for the private subnets"
  type        = list(string)
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "tags" {
  description = "Common tags to assign to resources"
  type        = map(string)
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
}

variable "engine" {
  description = "The database engine to use"
  type        = string
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The name of the database to create"
  type        = string
}

variable "username" {
  description = "Username for the master DB user"
  type        = string
}

variable "password" {
  description = "Password for the master DB user"
  type        = string
  sensitive   = true
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group to associate"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs to associate"
  type        = list(string)
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}
