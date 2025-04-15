terraform {
  backend "s3" {
    bucket = "open-projecttask123"  # Replace with your unique S3 bucket name
    region = "us-west-2"  # Replace with your desired AWS region
  }
}
