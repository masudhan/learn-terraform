### S3 Backend

I'm going to create one S3 backend which will store the state file. As i'm the only one working. I'm not going to create dynamodb table (saving some cost)

`terraform init` </br>
`terraform plan` </br>
`terraform apply` </br>

I'm going to refer this s3 backend in each provider block for state file