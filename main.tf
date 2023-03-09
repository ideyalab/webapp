terraform {
 required_providers {
  aws = {
   source = "hashicorp/aws"
  }
 }
}
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAT5OHR2KO53QOYPHP"
  secret_key = "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"
}


resource "aws_eks_cluster" "devopsthehardway-eks" {
 name = "terrafrom-cluster"
 role_arn = "arn:aws:iam::269390828189:role/eks_cluster"

 vpc_config {
  subnet_ids = [ "subnet-02a4a455d98d344a0", "subnet-0c1da9fc8ca557fbc" ]
 }
}
 resource "aws_eks_node_group" "worker-node-group" {
  cluster_name  = aws_eks_cluster.devopsthehardway-eks.name
  node_group_name = "devopsthehardway-workernodes"
  node_role_arn  = "arn:aws:iam::269390828189:role/workernode"
  subnet_ids   = [ "subnet-02a4a455d98d344a0", "subnet-0c1da9fc8ca557fbc"]
  instance_types = ["t3.medium"]

  scaling_config {
   desired_size = 1
   max_size   = 1
   min_size   = 1
  }

 
