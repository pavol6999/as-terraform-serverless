terraform {
  required_version = "1.3.1"


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.29.0"
    }
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.4.6"
    }
  }
}


provider "mongodbatlas" {
  public_key  = var.mongodb.public_key
  private_key = var.mongodb.private_key
}

provider "aws" {
  profile = "pablo"
  region  = var.region
  default_tags {
    tags = merge({
      "Managed by" = "Terraform"
    }, var.global_tags)
  }
}
