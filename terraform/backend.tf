terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "lambda/hello-lambda.tfstate"
    region = "ap-northeast-1"
  }
}
