**Things need to do before running**

1.  Create a S3 bucket with - `dev-terraform-state`  and block all public access, if this is already taken then try another name.

    Add the bucket name in **main.tf** file along with folder location

    modify the region as per your needs in `main.tf` and `provider.tf`

2.  Create a key pair from EC2 and mention the keypair name in `modules/jenkins-server/main.tf` -> key_name = "jenkins-key-pair"

3.  Create a `terraform.tfvars` file and add the variables key and values

    example:        
    ```
        # VPC variables
        env-prefix     = <fill this> ex: "dev-vpc"
        vpc_cidr_block = <fill this>


        # public subnet variables
        public_subnet_1_cidr_block = <fill this>
        public_subnet_1_az         = <fill this>

        # SG variables
        security_group_for_jenkins_name     = <fill this>
        security_group_ingress_1_cidr_block = ["0.0.0.0/0"]
        security_group_ingress_2_cidr_block = ["0.0.0.0/0"]
        security_group_egress_1_cidr_block  = ["0.0.0.0/0"]

        # Jenkins instance variables
        jenkins_instance_ami                         = "ami-00ff962d94b87fe06"
        jenkins-instance_associate_public_ip_address = true
        jenkins_instance_az                          = "ap-south-1a"
        jenkins_instance_instance_type               = "t2.micro"
    ```



**How to run**

`terraform init`

`terraform validate`

`terraform plan`

`terraform apply --auto-approve`


*This will create vpc, subnets, route table, internet gateway and will launch an ec2 instance (t2.micro) in ap-south-1a availability zone*