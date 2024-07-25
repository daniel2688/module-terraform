variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
  default     = 2
}

variable "frontend_ami" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to use"
  type        = string
}

variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
}

variable "subnet_ids" {  # Usamos subnet_ids aquí
  description = "List of subnet IDs to launch instances in"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs to associate"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to the instances"
  type        = map(string)
}

