### State, Remote State and Variables

Whenever terraform is trying to provisioning the infra in any cloud provider. It's going to create `terraform.tfstate` file automatically. Which basically stores all the resource information about the infra that it is going to create. This is used to track the infra that it is created

We shouldn't store `terraform.tfstate` in our local machine, if we lose that state file and ask terraform to create infra, it is going to recreate new infra again. Another reason would be what if there are multiple developers and all are referring to same repo and making changes that will corrupt the state file. So the solution for that one is to have a centralized place to store the state file and state lock 

For state file, use S3 backend </br>
For state lock, use DynamoDB </br>

State lock will help us to make the changes one person at a time. Also duplication and errors will be removed

So in S3 Backend folder, we'll create resource for bucket to store state file and dynamodb table. Now we'll refer these details in Day3's `provider.tf` file as backed "s3"

**Variables**

If we are repeating same values at multiple values it's better to use variables. We need to create `variables.tf` file to store the variables

#### Types can be
1. string</br>
2. number</br>
3. bool</br>
4. list(<TYPE>)</br>
5. set(<TYPE>)</br>
6. map(<TYPE>)</br>
7. object({<ATTR NAME> = <TYPE>, ... })</br>
8. tuple([<TYPE>, ...])country</br>

We can either give variables values as default in `variables.tf` or while running `terraform apply -var "country-prod-vpc-cidr=192.0.0.0/16"` or create a file `terraform.tfvars` and define in them. You can always override from the cli as well.