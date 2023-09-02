# aws-inspector

Amazon Inspector vulnerability scan.

👉 Use the Console to enable Inspector.

Create the test resources:

```sh
terraform init
terraform apply -auto-approve
```

To scan an ECR image, upload one if none is available:

```sh
docker pull ghcr.io/epomatti/stressbox
docker tag ghcr.io/epomatti/stressbox "$account.dkr.ecr.$region.amazonaws.com/stressbox:latest"
aws ecr get-login-password --region $region | docker login --username AWS --password-stdin "$account.dkr.ecr.$region.amazonaws.com"
docker push "$account.dkr.ecr.$region.amazonaws.com/stressbox:latest"
```