#!/bin/bash

account=$(aws sts get-caller-identity --query "Account" --output text)
region="us-east-2"
ecrRepoName="stressbox"

docker pull ghcr.io/epomatti/stressbox
docker tag ghcr.io/epomatti/stressbox "$account.dkr.ecr.$region.amazonaws.com/$ecrRepoName:latest"
aws ecr get-login-password --region $region | docker login --username AWS --password-stdin "$account.dkr.ecr.$region.amazonaws.com"
docker push "$account.dkr.ecr.$region.amazonaws.com/$ecrRepoName:latest"
