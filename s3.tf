terraform {
  backend "s3" {
    bucket = "taskterra"
    key    = "main"
    region = "us-east-1"
    dynamodb_table = "my-dynamo-db-table"
  }
}
