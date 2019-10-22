# Search for instances by name with wildcards
function instanceidsbyname {
  readonly instance_name=${1:?"Must specify an instance name."}
  aws ec2 describe-instances \
   --filters "Name=tag:Name,Values=*${instance_name}*" Name=instance-state-name,Values=running \
   --query 'Reservations[*].Instances[*].[Tags[?Key==`Name`] | [0].Value, InstanceId, State.Name]' \
   --output table
}