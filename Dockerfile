FROM ubuntu:22.04

RUN apt update
RUN apt install -y curl iproute2 sshfs unzip less groff docker.io
# Update package lists and install necessary dependencies
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl

# Download and install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Update package lists and install necessary dependencies
RUN apt-get update && apt-get install -y unzip curl

# Download and install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install

# Download and install Terraform
RUN curl "https://releases.hashicorp.com/terraform/0.15.4/terraform_0.15.4_linux_amd64.zip" -o "terraform.zip" && unzip terraform.zip && install -o root -g root -m 0755 terraform /usr/local/bin/terraform

# Set the default command
CMD [ "aws", "--version" ]

# Set the default command
CMD [ "kubectl", "--help" ]
