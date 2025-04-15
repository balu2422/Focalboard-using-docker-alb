terraform {
  backend "s3" {
    bucket = "open-projecttask123"  # Replace with your unique S3 bucket name
    key    = "path/to/terraform.tfstate"  # Specify the path to the state file inside the bucket
    region = "us-west-2"  # Replace with your desired AWS region
  }
}
