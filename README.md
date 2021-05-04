# cloudformation


* Shortcuts
- `make package`
- `make deploy`

* Package a CFN Template
```
aws cloudformation package --template-file templates/02_create_aws_cfn_stack.yaml --s3-bucket <s3-bucket-name> --s3-prefix <prefix-name> --output-template-file template.yaml
```

* Deploy a stack
```
aws cloudformation deploy \
--stack-name <stack_name> \
--template-file <relative path of template.yaml> \
--capabilities CAPABILITY_IAM
```

* List Stack
* Create Stack
```
aws cloudformation create-stack --stack-name myteststack --template-body file://sampletemplate.json --parameters ParameterKey=KeyPairName,ParameterValue=TestKey ParameterKey=SubnetIDs,ParameterValue=SubnetID1\\,SubnetID2
```

Output
```
{
    "StackId": "arn:aws:cloudformation:us-east-1:123456789012:stack/myteststack/466df9e0-0dff-08e3-8e2f-5088487c4896"
}
```
* Describe Stack
```
aws cloudformation describe-stacks --stack-name myteststack
```
Outputs
```
{
    "Stacks": [
        {
            "StackId": "arn:aws:cloudformation:us-east-1:669444922660:stack/s3bucketam/7f571db0-a357-11eb-8805-0a48dc861a07",
            "StackName": "s3bucketam",
            "Description": "I can use this template to launch a S3 Bucket\n",
            "CreationTime": "2021-04-22T10:42:55.924Z",
            "RollbackConfiguration": {},
            "StackStatus": "CREATE_COMPLETE",
            "DisableRollback": false,
            "NotificationARNs": [],
            "Outputs": [
                {
                    "OutputKey": "BucketARN",
                    "OutputValue": "arn:aws:s3:::s3bucketam-s3bucket-oqumcclmarzc"
                },
                {
                    "OutputKey": "BucketName",
                    "OutputValue": "s3bucketam-s3bucket-oqumcclmarzc",
                    "Description": "Name of the S3 Bucket"
                }
            ],
            "Tags": [],
            "EnableTerminationProtection": false,
            "DriftInformation": {
                "StackDriftStatus": "NOT_CHECKED"
            }
        }
    ]
}
```
* Update Stack
```bash
aws cloudformation update-stack --stack-name <stack_name> --template-body file://`pwd`/templates/01_create_s3_bucket.yaml
```

```
{
    "StackId": "arn:aws:cloudformation:us-east-1:669444922660:stack/s3bucketam/7f571db0-a357-11eb-8805-0a48dc861a07"
}
```
* Delete Stack
```
aws-okta exec alamin-sandbox -- aws cloudformation delete-stack --stack-name s3bucketam
```
