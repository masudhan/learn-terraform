module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.26.6"

  cluster_name    = local.cluster_name
  cluster_version =  var.cluster_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_group_defaults = {
    ami_type = var.ami_type

    attach_cluster_primary_security_group = var.attach_cluster_primary_security_group

    # Disabling and using externally provided security groups
    create_security_group = var.create_default_security_group
  }

  eks_managed_node_groups = {
    one = {
      name = var.node_group_1_name

      instance_types = var.instance_types

      min_size     = var.worker_node_1_minimum_instances
      max_size     = var.worker_node_1_maximum_instances
      desired_size = var.worker_node_1_desired_instances

      pre_bootstrap_user_data = <<-EOT
      echo 'dev-eks-cluster'
      EOT

      vpc_security_group_ids = [
        aws_security_group.node_group_one.id
      ]
    }
  }
}
