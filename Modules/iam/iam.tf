data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = var.effect

    principals {
      type        = var.type
      identifiers = var.eks_identifiers
    }

    actions = var.actions
  }
}

data "aws_iam_policy_document" "ng_assume_role" {
  statement {
    effect = var.effect

    principals {
      type        = var.type
      identifiers = var.ng_identifiers
    }

    actions = var.actions
  }
}
#====
#-- EKS
resource "aws_iam_role" "Shweta-eks_role" {
  name               = "Shweta-eks-cluster"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}
#-- NG
resource "aws_iam_role" "Shweta-write-ng_role" {
  name               = "Shweta-eks-ng"
  assume_role_policy = data.aws_iam_policy_document.ng_assume_role.json
}

#-----EKS---------

resource "aws_iam_role_policy_attachment" "Shweta-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.Shweta-eks_role.name
}

resource "aws_iam_role_policy_attachment" "Shweta-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.Shweta-eks_role.name
}

#---- NG -----

resource "aws_iam_role_policy_attachment" "Shweta-NGPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy" 
  role       = aws_iam_role.Shweta-write-ng_role.name
}

resource "aws_iam_role_policy_attachment" "Shweta-NG_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy" 
  role       = aws_iam_role.Shweta-write-ng_role.name
}

resource "aws_iam_role_policy_attachment" "Shweta-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.Shweta-write-ng_role.name
}