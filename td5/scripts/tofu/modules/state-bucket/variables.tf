# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------

variable "name" {
  description = "The base name for the S3 bucket and all other resources"
  type        = string
}

variable "dynamodb_table" {
  description = "The name of the DynamoDB table for Terraform state locking"
  type        = string
}