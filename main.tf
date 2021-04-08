
# ref: https://www.terraform.io/docs/providers/aws/d/caller_identity.html
data "aws_caller_identity" "current" {}

# ref: https://www.terraform.io/docs/providers/aws/r/iam_role.html
resource "aws_iam_role" "iam_role" {
  name                  = var.name
  path                  = var.path
  description           = var.description
  permissions_boundary  = var.enable_gcci_boundary ? "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/GCCIAccountBoundary" : ""
  assume_role_policy    = var.base_policy
  force_detach_policies = true

  tags = var.tags
}

# Only create the custom inline policy for this role if it's not empty
resource "aws_iam_role_policy" "custom_policy" {
  name   = "custom_policy"
  role   = aws_iam_role.iam_role.name
  count  = var.custom_policy != "" ? 1 : 0
  policy = var.custom_policy
}

# Maps the given list of existing policies to the role
resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.iam_role.name
  for_each   = var.attach_policies
  policy_arn = each.value
}