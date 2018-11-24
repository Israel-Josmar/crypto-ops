provider "aws" {
  region = "us-east-1"
}

resource "aws_lambda_function" "crypto_api" {
  function_name = "CryptoAPI"
  s3_bucket = "terraform-serverless-example2"
  s3_key    = "v1.0.0/crypto-api.zip"
  handler = "src/index-lambda.dashboard"
  role = "${aws_iam_role.lambda_exec.arn}"
  runtime = "nodejs8.10"
}

resource "aws_iam_role" "lambda_exec" {
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
