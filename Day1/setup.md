### Environment setup

In my case i'm using ubuntu so following these steps,

1. Terraform

```
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform`

```

```
❯ terraform --version
Terraform v1.4.6
on linux_amd64

```

2. AWS CLI - https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#:~:text=Install%20and%20update%20requirements

❯ aws --version
aws-cli/2.11.15 Python/3.11.3 Linux/5.19.0-41-generic exe/x86_64.ubuntu.22 prompt/off

3. Create an IAM user with Admin Access

4. Create security credentials and create access key and secret access key to communicate via CLI 

</br>

`aws configure` </br>
    give access key, secret access keys, region and output


