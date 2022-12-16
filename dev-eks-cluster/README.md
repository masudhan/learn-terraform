**Launch an EKS Cluster in SSG Dev Environmet**

This is going to launch 49 resources

1.  VPC

2.  3 public subnets and 3 private subnets

3.  1 public route table and 1 private route table and do the public and private subnet associations

4.  1 NAT gateway

5.  1 internet gateway

6.  EKS Cluster with one node and associated security groups, iam roles etc

To use this module for any other cluster creation, change the values in `terraform.tfvars` and change the cluster name in `main.tf`

If you want add any bootstrap script in `eks-cluster.tf`

**How to create the infrastructure**

`terraform init`

`terraform validate`

`terraform plan`

`terraform apply --auto-approve`

**How to destroy the infrastructure**

`terraform destroy`

**Roles required to access eks cluster**

`AmazonEKSServicePolicy`

**How to access the eks cluser**

Install below packages

1.  [AWS IAM Authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html)

2.  [kubectl](https://kubernetes.io/docs/tasks/tools/)

**Get the kube config file to your local machine**

`aws eks --region ap-south-1 update-kubeconfig --name <clustername>`



