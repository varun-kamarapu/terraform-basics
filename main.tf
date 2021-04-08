resource "aws_iam_user" "iam_users"{
name = var.iam-users[count.index]
tags = {
  "source" = "terraform"
}
count = length(var.iam-users)
}

resource "aws_iam_user_policy" "iam-policy" {
  user = var.iam-users[count.index]
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
  count = length(var.iam-users)
}

