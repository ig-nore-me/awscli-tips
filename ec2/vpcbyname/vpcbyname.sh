# Get the ID of the VPC with the provided name
function vpcbyname () {
    aws ec2 describe-vpcs --filters "Name=tag:Name,Values=${1}" --query 'Vpcs[0].VpcId' --output text;
}