# 🚀 Server Auto-Provisioning with Ansible & Terraform

An end-to-end automated infrastructure project demonstrating the "Infrastructure as Code" (IaC) and "Configuration Management" principles of modern DevOps.

## 🎯 Project Overview

This project automatically provisions an AWS EC2 instance using **Terraform** and then immediately configures it using **Ansible**. The entire workflow is automated via **GitHub Actions**.

### Architecture Workflow:
1. **GitHub Actions** triggers on a push to `main`.
2. **Terraform** provisions a new Ubuntu EC2 instance, VPC, Subnet, and Security Group on AWS.
3. **Ansible** connects to the newly created instance via SSH and automatically:
   - Updates packages
   - Installs Docker and Nginx
   - Sets up a custom Nginx index page
   - Creates a dedicated `deploy` user with sudo privileges

---

## 🛠️ Tech Stack

**Infrastructure & Configuration Management**

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Ansible](https://img.shields.io/badge/ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)

**CI/CD & Server**

![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Nginx](https://img.shields.io/badge/nginx-%23009639.svg?style=for-the-badge&logo=nginx&logoColor=white)

---

## 📁 Directory Structure

```text
ansible-server-provisioning/
├── .github/
│   └── workflows/
│       └── main.yml        # CI/CD Pipeline definition
├── ansible/
│   ├── ansible.cfg         # Ansible configuration
│   └── playbook.yml        # The playbook to install Docker & Nginx
├── terraform/
│   ├── main.tf             # AWS Resources (VPC, EC2, SG)
│   ├── variables.tf        # Input variables
│   ├── outputs.tf          # Output values (e.g., EC2 Public IP)
│   └── terraform.tfvars.example # Example variable values
└── README.md
```

## 🚀 How It Works

### 1. Terraform (Infrastructure setup)
Terraform is responsible for interacting with AWS APIs to create the raw server. It sets up the networking (VPC, internet gateway, route tables, subnets) and launches a fresh Ubuntu 22.04 EC2 instance. It returns the public IP address of this instance as an output.

### 2. Ansible (Configuration Management)
Instead of writing complicated and hard-to-maintain bash scripts (`user_data`), this project uses Ansible to cleanly define the desired state of the server.
The GitHub Actions pipeline extracts the IP address from Terraform, dynamically generates an Ansible inventory file, and runs the playbook to configure the server without human intervention.

## 🔐 Required Secrets

To run this in your own GitHub repository, you need to configure the following Repository Secrets:

* `AWS_ACCESS_KEY_ID`: Your AWS access key.
* `AWS_SECRET_ACCESS_KEY`: Your AWS secret key.
* `EC2_SSH_PRIVATE_KEY`: The private key (`.pem`) used to SSH into the provisioned EC2 instance. Ensure this matches the `key_name` variable in your Terraform configuration.
