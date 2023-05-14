1. First we need to configure provider, In my case i'm using [AWS](https://registry.terraform.io/providers/hashicorp/aws/latest), Create provider.tf file
2. Create ec2.tf and get the sample code from terraform documentation - [aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) </br>
    `terraform init` - This will contact hashicorp aws through the internet and will download the provider  </br>
    `terraform plan` - What are the resources that you're going to provision, in this case it's an ec2 instance </br>
    `terraform apply` - To take action on AWS
    `terraform destroy` - Delete all the resources in AWS

### Advantages of terraform 

1. **Version Control**
2. **Consistent infrastructure** (for dev, qa, perf and production) - similar infra in multiple env with more reliability
3. **Automated infrastructure provisioning and managing**
4. **Inventory Management** - easy to see what resources are created in which region using terraform
5. **Cost optimization**
6. **Automatic dependency management** - Terraform can understand the dependency of resources. In our case, i've created ec2, it understood and took the default vpc and subnets
7. **Modular infrastructure** - we can develop/use open source modules