#!/bin/bash

aws_account_name=${aws_account_name}
aws_account_id=${aws_account_id}
aws_region=${aws_region}
ACCESS_KEY=${cloudmapper_access_key}
SECRET_KEY=${cloudmapper_secret_key}

yum update -y
yum install docker -y
yum -y install git
systemctl restart docker
systemctl enable docker
git clone https://github.com/duo-labs/cloudmapper.git
cd cloudmapper
sed -i "s/urllib3==1.26.5/urllib3==1.25.10/g" requirements.txt
sed -i "s/us-east-1/$aws_region/g" Dockerfile
cp config.json.demo config.json
sed -i "s/123456789012/$aws_account_id/g" config.json
sed -i "s/demo/$aws_account_name/g" config.json
public_ip=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
echo "CloudMapper can be accessed at $public_ip on port 8000"
echo "Report details can be accessed on /account-data/report.html"
docker build -t cloudmapper .
docker run -dt \
        -e AWS_ACCESS_KEY_ID=$ACCESS_KEY \
        -e AWS_SECRET_ACCESS_KEY=$SECRET_KEY \
        -p 8000:8000 \
        --name cloudmapper \
        cloudmapper

docker exec -dt cloudmapper python cloudmapper.py collect --account $aws_account_name
docker exec -dt cloudmapper python cloudmapper.py report --account $aws_account_name
docker exec -dt cloudmapper python cloudmapper.py prepare --account $aws_account_name
docker exec -dt cloudmapper python cloudmapper.py webserver --public
