resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "terraform-state-locks"
  hash_key       = "LockID"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "LockID"
    type = "S"
  }

  tags {
    Name      = "Terraform State Lock Table"
    Terraform = "True"
  }
}
