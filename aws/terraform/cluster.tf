module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.kubernetes_version_prefix

  cluster_endpoint_public_access = true
  enable_irsa                    = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
    snapshot-controller = {
      most_recent = true
    }
    aws-ebs-csi-driver = {
      most_recent              = true
      service_account_role_arn = module.ebs_controller_role.iam_role_arn
    }
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
  }

  eks_managed_node_groups = {
    example = {
      min_size     = var.min_nodes
      max_size     = var.max_nodes
      desired_size = var.node_count

      instance_types = ["t3.large", "m6i.large", "m5.large", "m5n.large", "m5zn.large"]
      capacity_type  = "SPOT"
      iam_role_additional_policies = {
        AmazonEBSCSIDriverPolicy = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
      }
    }
  }

  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = true

  tags = var.tags
}

data "aws_eks_cluster_auth" "current" {
  name = module.eks.cluster_name
}

resource "kubernetes_storage_class_v1" "gp2-resize" {
  storage_provisioner = "ebs.csi.aws.com"
  allow_volume_expansion = true
  volume_binding_mode = "WaitForFirstConsumer"
  metadata {
    name = "default-gp2-resize"
    annotations = {
      "storageclass.kubernetes.io/is-default-class" = "true"
    }
  }
}

resource "kubernetes_annotations" "default-storageclass" {
  api_version = "storage.k8s.io/v1"
  kind        = "StorageClass"
  force       = "true"

  metadata {
    name = "gp2"
  }
  annotations = {
    "storageclass.kubernetes.io/is-default-class" = "false"
  }
}