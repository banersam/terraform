resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy_tf"
  role = aws_iam_role.lambda_role.id

  policy = file("iam/iam-policy.json")
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

  assume_role_policy = file("iam/iam-role.json")
}
