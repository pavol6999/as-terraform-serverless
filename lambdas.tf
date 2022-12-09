
locals {
  uri            = trimprefix(mongodbatlas_serverless_instance.serverless_db.connection_strings_standard_srv, "mongodb+srv://")
  connection_uri = "mongodb+srv://${var.username}:${var.password}@${local.uri}"
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

resource "aws_lambda_function" "video_insert_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "video_insert.zip"
  function_name = "video_insert"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.handler"


  source_code_hash = filebase64sha256("video_insert.zip")

  runtime = "nodejs16.x"

  environment {
    variables = {
      URI = local.connection_uri
    }
  }
}



resource "aws_lambda_function" "video_get" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "video_get.zip"
  function_name = "video_get"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.handler"


  source_code_hash = filebase64sha256("get_videos.zip")

  runtime = "nodejs16.x"

  environment {
    variables = {
      URI = local.connection_uri
    }
  }
}



resource "aws_lambda_function" "infobox_insert" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "infobox_insert.zip"
  function_name = "infobox_insert"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.handler"


  source_code_hash = filebase64sha256("infobox_insert.zip")

  runtime = "nodejs16.x"

  environment {
    variables = {
      URI = local.connection_uri
    }
  }
}
