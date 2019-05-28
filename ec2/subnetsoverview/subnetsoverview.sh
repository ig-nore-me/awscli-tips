# Gives a basic overview of the subnets in a VPC
function subnetsoverview() {
    aws ec2 describe-subnets --filters "Name=vpc-id,Values=$(vpcbyname ${1})" --query 'sort_by(Subnets, &AvailableIpAddressCount)[*].{Id: SubnetId, AZ: AvailabilityZone, CIDR: CidrBlock, IPs: AvailableIpAddressCount}' --output table
}