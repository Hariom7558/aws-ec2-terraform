# AWS EC2 Provisioning with Terraform

## Task Objective
Learn AWS core concepts and Terraform.  
Launch an EC2 instance manually in AWS.  
Provision an EC2 instance using Terraform.  
Document the entire process.

---

## 1️⃣ Manual EC2 Launch

### Steps:
1. Log in to the AWS Console.  
2. Go to **EC2 → Instances → Launch Instances**.  
3. Select **Ubuntu Server 22.04 LTS (AMI)**.  
4. Choose **t3.micro** instance type (free tier eligible).  
5. Configure network and default VPC/subnet.  
6. Add a security group allowing **SSH (port 22)** and **HTTP (port 80)** if needed.  
7. Select an existing key pair or create a new one.  
8. Launch the instance.

### Result:
- EC2 instance manually created.  
- **Name:** manual-EC2  
- **Instance type:** t3.micro  
- **AMI:** Ubuntu 22.04 LTS  

---

## 2️⃣ Terraform Setup

### Steps:
1. Installed Terraform on Windows.  
2. Created project folder:

```powershell
mkdir C:\Users\Dell\aws-ec2-terraform
cd C:\Users\Dell\aws-ec2-terraform
provider.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.30.0"
    }
  }
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "ap-south-1"  # Mumbai
}
main.tf
resource "aws_instance" "terraform_ubuntu" {
  ami           = "ami-0f58b397bc5c1f2e8"  # Ubuntu 22.04 LTS
  instance_type = "t3.micro"
  key_name      = "Manual-key"

  tags = {
    Name = "terraform-ubuntu-ec2"
  }
}
Provision EC2 with Terraform
terraform init    # Initialize Terraform
terraform plan    # Review actions
terraform apply   # Apply and create EC2
Notes:
Terraform created a new EC2 instance: terraform-ubuntu-ec2.

The manually created EC2 was destroyed in our previous run because it was not defined in main.tf.

Key point: Terraform manages only resources defined in .tf files.


Observations / Lessons Learned
Terraform is declarative: ensures infrastructure matches the .tf files.

Imported resources not defined in .tf will be destroyed on terraform apply.

Terraform makes infrastructure reproducible and version controlled.

AWS CLI and Terraform together allow manual and automated management.


---

✅ **Next step:**  

1. Save this as `AWS-EC2-Terraform.md` in your project folder.   

aws-ec2-terraform/
├─ main.tf
├─ provider.tf
├─ AWS-EC2-Terraform.md
├─ screenshots/
├─ manual_ec2.png
└─ terraform_ec2.png
