args = `arg="$(filter-out $@,$(MAKECMDGOALS))" && echo $${arg:-${1}}`

%:
	@:

test:
	@echo $(call args,defaultstring)

package:
	aws cloudformation package \
	--template-file templates/02_create_aws_cfn_stack.yaml \
	--s3-bucket cf-templates-omrts84ug010-us-east-1 \
	--s3-prefix cf-templates \
	--output-template-file template.yaml 

deploy:
	aws cloudformation deploy \
	--template-file template.yaml \
	--stack-name AWSCFNStack-Development \
	--capabilities CAPABILITY_IAM
