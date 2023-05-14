### Deploy 3 tier architecture

![3-tier-architecture](https://docs.aws.amazon.com/images/whitepapers/latest/serverless-multi-tier-architectures-api-gateway-lambda/images/image2.png)

We need to create this infra on AWS, and below resources will be deployed

1. VPC </br>
    a) Public and Private Subnets </br>
    b) Route table </br>
    c) Internet gateway </br>
    d) NAT gateway </br>
    
In `vpc.tf`, left side arguments inside resource block is called `Argument Reference` . Similarly right side values for vpc_id is called `Attributes Reference` (this means terraform is going to give these values once the infra is created like an output)

`Route Table` is the deciding factor for public and private subnets

In the .tf files I'm hardcoding everything to understand the tip of the iceberg. Later on i'm gonna automate this