## Install pre-requisites
echo "Installing pre-requisites"
sudo yum -y install \
    zlib-devel openssl-devel ncurses-devel libffi-devel \
    sqlite-devel.x86_64 readline-devel.x86_64 bzip2-devel.x86_64

## Install eb cli
echo "Installing ElasticBeanstalk CLI"
git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git
./aws-elastic-beanstalk-cli-setup/scripts/bundled_installer

## Setup eb
echo 'export PATH="/home/ec2-user/.ebcli-virtual-env/executables:$PATH"' >> ~/.bash_profile && source ~/.bash_profile

## Verify eb installation
eb --version

## Install PG13
echo "Installing PG13"
sudo amazon-linux-extras install epel
sudo tee /etc/yum.repos.d/pgdg.repo<<EOF
[pgdg13]
name=PostgreSQL 13 for RHEL/CentOS 7 - x86_64
baseurl=https://download.postgresql.org/pub/repos/yum/13/redhat/rhel-7-x86_64
enabled=1
gpgcheck=0
EOF
sudo yum -y install postgresql13

## Verify postgres installation
psql --version

## Install jq
sudo yum install jq -y