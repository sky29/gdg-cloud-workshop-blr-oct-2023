cd `folder`

source .env

terraform init

terraform plan

terraform apply

terraform destroy


# Service account configuration:

GCP Console --> IAM and Admin --> Service Accounts --> Create SA --> assign appropriate rle

export GOOGLE_APPLICATION_CREDENTIALS=sa.json
run terraform scripts

OR

configure provider like mentioned below:

provider "google" {
  project = var.project_id
  region = var.region
  credentials = file("sa.json")
}
