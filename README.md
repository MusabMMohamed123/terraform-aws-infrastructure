
# AWS EC2 Infrastructure with Terraform and GitHub Actions

This repository contains Terraform configurations and GitHub Actions workflow to automate the provisioning of an AWS EC2 infrastructure, including a VPC and an Apache web server deployed on an EC2 instance.

## Prerequisites

- AWS Account
- Terraform Installed
- GitHub Repository

## Terraform Configuration

1. Clone this repository:
   ```sh
   git clone https://github.com/yourusername/your-repo.git
   cd your-repo

2. Update `terraform.tfvars` with your AWS credentials and other variables.

3. Initialize and apply the Terraform configuration:
   sh
   terraform init
   terraform apply
   

## EC2 Instance and Apache Setup

1. After Terraform applies the configuration, note the public IP address of the EC2 instance.

2. SSH into the EC2 instance:
   sh
   ssh -i /path/to/your/key.pem ec2-user@ec2-public-ip
   

3. Install Apache web server:
   sh
   sudo yum install httpd -y
   

4. Start Apache:
   sh
   sudo systemctl start httpd
   

5. Create an HTML file for your website:
   sh
   echo "<html><body><h1>hello world!</h1></body></html>" | sudo tee /var/www/html/index.html
   

6. Open a web browser and enter the EC2 instance's public IP address to see your webpage.

## GitHub Actions Workflow

The included `.github/workflows/main.yml` sets up a GitHub Actions workflow that automates the Terraform provisioning and deployment process.

1. Push your changes to the GitHub repository.

2. Visit the "Actions" tab in your repository to see the workflow in action.

## Cleanup

To avoid incurring charges, remember to destroy the resources:

sh
terraform destroy


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


Please replace placeholders like `yourusername`, `your-repo`, `/path/to/your/key.pem`, and customize the content as needed to match your project's specifics. Additionally, ensure that your Terraform configurations, GitHub Actions workflows, and other files are organized and named appropriately based on the instructions in the `README.md`.
