terraform{
  backend "s3" {
    bucket         = "open-projecttask123"
    key            = "terraform/state"
    region         = "us-west-2"
    encrypt        = true
  }
}
