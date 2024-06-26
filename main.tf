provider "aws" {
 region = var.REGION 
}
resource "aws_lightsail_instance" "server1" {
  name = "dev-server1"
  blueprint_id = "ubuntu_18_04"
  bundle_id = var.INSTANCE_TYPE
  availability_zone = "us-east-1"
  user_data = <<-EOF
  #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y apache2
    sudo systemctl start apache2
    sudo systemctl enable apache2
    echo '<h1>This is deployed by Serge </h1>' | sudo tee /var/www/html/index.html
    EOF
    tags = {
      name= var.ENVIRONMENT
    }
}