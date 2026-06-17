terraform {
  backend "s3" {
    bucket         = "k8s-cluster-terraform-backend-joo"
    key            = "gitops-app/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true
  }
}
