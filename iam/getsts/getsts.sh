# Retrieves an STS token and exports it as environment variables
function getsts() {
  mfa=$(aws iam list-mfa-devices --query 'MFADevices[0].SerialNumber' --output text)
  code=${1}
  token=$(aws sts get-session-token --serial-number $mfa --token-code ${code})
  export AWS_ACCESS_KEY_ID=$(echo $token | jq -r '.Credentials.AccessKeyId')
  export AWS_SECRET_ACCESS_KEY=$(echo $token | jq -r '.Credentials.SecretAccessKey')
  export AWS_SESSION_TOKEN=$(echo $token | jq -r '.Credentials.SessionToken')
}