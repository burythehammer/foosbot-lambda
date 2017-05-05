provider "aws" {
  region = "eu-west-1"
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

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

resource "aws_lambda_function" "foosbot_lambda" {
  function_name = "foosbot_lambda"
  filename = "target/function.zip"
  role = "${aws_iam_role.iam_for_lambda.arn}"
  handler = "index.handler"
  runtime = "nodejs4.3"
  source_code_hash = "${base64sha256(file("target/function.zip"))}"

  tags = {

    Owner = "matt"
    Name = "foosbot_lambda"
    Project = "foosbot"

  }
}