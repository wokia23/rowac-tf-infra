
variable "ami_id" {
  type        = string
  default     = "ami-04fc83311a8d478df"
  description = "instance ami used"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Instance type used"
}