I'm going to divide this repository into two parts

1. AWS
2. GCP

First we'll start of with AWS..

**SETUP**

1.  [AWS account](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/)

2.  [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

`aws --version`

Create a new IAM [User](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html) and assign Administrator Role

![IAMUSER](./screenshots/IAM_USER.png)

Download the `access_key` and `secret_access_key`

in you cli, 

`aws configure` then enter the access_key and secret_access_key

All the aws related credentails will be store at `/home/${USER}/.aws`

3.   [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli#:~:text=popular%20package%20managers.-,Install%20Terraform,-Manual%20installation)

