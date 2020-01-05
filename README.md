# huz-cloud

Scripts to setup huz in cloud.

## aws
<img src='https://github.com/vjyq/huz-cloud/blob/master/infrastructure/aws/huz-2020-01-04.png?raw=true'>

```
# Get huz-cloud
git clone https://github.com/vjyq/huz-cloud.git

# Install terraform
brew install terraform

# Configure aws cli
# https://docs.amazonaws.cn/en_us/cli/latest/userguide/cli-chap-configure.html

cd ./infrastructure
terraform init
terraform plan # to see what is going to happen. If, as expected,
terraform apply

# Destroy everything?
terraform destroy
```

## Author
yuqing.ji@outlook.com
