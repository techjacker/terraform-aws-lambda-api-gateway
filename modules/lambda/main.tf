resource "aws_lambda_function" "lambda" {
  s3_bucket        = "${var.s3_bucket}"
  s3_key           = "${var.s3_key}"
  function_name    = "${var.function_name}"
  role             = "${var.role}"
  handler          = "${var.handler}"
  runtime          = "${var.runtime}"
  source_code_hash = "${var.hash}"

  vpc_config {
    subnet_ids         = ["${var.subnet_ids}"]
    security_group_ids = ["${var.security_group_ids}"]
  }

  environment {
    variables = {
      SQLALCHEMY_DATABASE_URI = "${var.database_uri}"
      APP_CONFIG_FILE         = "${var.app_config}"
    }
  }
}
