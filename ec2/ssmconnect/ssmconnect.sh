# Functions to use AWS SSM to connect to an instance, either by Name tag or by ID
function ssmconnectbyname {
  readonly instance_name=${1:?"Must specify an instance name."}
  instance_id=$(aws ec2 describe-instances \
   --filters Name=tag:Name,Values=${instance_name} Name=instance-state-name,Values=running \
   --query "Reservations[0].Instances[0].[InstanceId]" \
   --output text)
  ssmconnectbyid $instance_id
}

function ssmconnectbyid {
  readonly instance_id=${1:?"Must specify an instance id."}
  echo "Connecting to ${instance_id}..."
  aws ssm start-session --target $instance_id
}