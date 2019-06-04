# Get a high-level overview of your instances, optionally limited by VPC
function instancenames () {
  filter=""
  # POSIX if statement so it works regardless of shell
  if [ ! -z $1 ] ;then
    filter="Name=vpc-id,Values=${1}"
  fi
  aws ec2 describe-instances --filters $filter --query 'Reservations[*].Instances[*].{Name:Tags[?Key==`Name`].Value[]
   | [0],ID:InstanceId,State:State.Name,"Private IP":PrivateIpAddress, VPC:VpcId, AZ:Placement.AvailabilityZone}' --output table
}