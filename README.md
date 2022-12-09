# Terraform project for AS FIIT 2022


## Setup

```terraform init```

```terraform plan```

```terraform apply```


### MongoDB

You need to have a MongoDB atlas user created and generate a public/private key pair. Then you need to create a file called `terraform.tfvars` in the root directory of the project and put the following content in it:

```hcl
public_key = "public_key"
private_key = "private_key"
```

You also need to have an organization in MongoDB atlas and copy the organization id


### AWS 

You need to have an AWS account and generate an access key and secret key. Then you need to create a file called `terraform.tfvars` in the root directory of the project and put the following content in it:

```hcl  
aws_access_key = "access_key"
aws_secret_key = "secret_key"
```



## Deployment"# as-terraform-serverless" 
