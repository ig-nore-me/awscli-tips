# Get all peering connections for the provided VPC
function peeringsforvpc () {
    aws ec2 describe-vpc-peering-connections --query "VpcPeeringConnections[?RequesterVpcInfo.VpcId == '${1}' || AccepterVpcInfo.VpcId == '${1}']"
}