# Terraform project for AS FIIT 2022

Serverless architecture is a cloud execution model, that rises as a new trend in web development and cloud infrastracture. In serverless architecture, developers can freely allocate resources to developing the bussiness model of the application and delegate the infrastructure and operations of servers on a third party provider.

In the document, we will look at the transformation of a web application consisting of multiple components to a new serverless architecture hosted on the cloud. The main focus will be on the bussiness logic of the application and so the client side application would be intact. The application consists of many use cases which may hinder the transformation process to a fully serverless platform. Therefore, it is upon us to prepare a plan to overcome this issues. The code of the application will be of stripped application to showacse the usage of Terraform. 


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