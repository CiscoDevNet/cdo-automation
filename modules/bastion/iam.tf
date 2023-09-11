resource "aws_iam_role" "ssm-role" {
  name        = "cdo-provider-example-ssm-role"
  path        = "/"
  description = "AWS IAM Role required for SSM managed instances"
  tags = {
    "Name" = "cdo-provider-example-ssm-role"
  }
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "attach-ssmManagedInstanceCore" {
  role       = aws_iam_role.ssm-role.name
  policy_arn = data.aws_iam_policy.AmazonSSMManagedInstanceCore.arn
}

resource "aws_iam_instance_profile" "lab-iam-profile" {
  name = "cdo-provider-example-ssm-instance-profile"
  role = aws_iam_role.ssm-role.name
}

data "aws_partition" "current" {}
data "aws_iam_policy" "AmazonSSMManagedInstanceCore" {
  arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
