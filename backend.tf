terraform {
    backend "s3" {
      bucket = "my-terraform-state-bucket"
      key = "prod/ec2-app-db/terraform.tfstate"
      region = "us-east-1"
      dynamodb_table = "terraform-lock"
      encrypt = true
    }
}