#config
GROUP_LOCATION=modules/groups
EXTERNAL_USERS_LOCATION=resources/externalaccount
INTERNAL_USERS_LOCATION=resources/internalaccount
GROUP_PLAN=group
INTERNAL_USERS_PLAN=internalusers
EXTERNAL_USERS_PLAN=externalusers

#Make routines

create-group:
	export AWS_PROFILE=dragosecaccesskey
	cd ${GROUP_LOCATION} && time terraform init
	cd ${GROUP_LOCATION} && time terraform plan -out ${GROUP_PLAN}.plan
# apply the output if plan approved
	cd ${GROUP_LOCATION} && time terraform apply ${GROUP_PLAN}.plan

	#cd ${GROUP_LOCATION} && time terraform apply


create-internal-users:
	export AWS_PROFILE=dragosecaccesskey
	cd ${INTERNAL_USERS_LOCATION} && time terraform init
	cd ${INTERNAL_USERS_LOCATION} && time terraform plan -var='userNames={johntope:"development",emmanuella:"qa"}' -out ${INTERNAL_USERS_PLAN}.plan
#    passed user in as command line variable -var - in real life could read with sed or awk from secure location
#	cd ${INTERNAL_USERS_LOCATION} && time terraform apply -var='userNames={"johntope":"development","emmanuella":"qa"}'
# apply the output if plan approved
	cd ${INTERNAL_USERS_LOCATION} && time terraform apply ${INTERNAL_USERS_PLAN}.plan



create-external-users:
	export AWS_PROFILE=dragosecaccesskey
	cd ${EXTERNAL_USERS_LOCATION} && time terraform init
	cd ${EXTERNAL_USERS_LOCATION} && time terraform plan -out ${EXTERNAL_USERS_PLAN}.plan
#	cd ${EXTERNAL_USERS_LOCATION} && time terraform apply
	cd ${EXTERNAL_USERS_LOCATION} && time terraform apply ${EXTERNAL_USERS_PLAN}.plan

destroy-internal-users:
	export AWS_PROFILE=dragosecaccesskey
	cd ${INTERNAL_USERS_LOCATION} && time terraform destroy

destroy-external-users:
	export AWS_PROFILE=dragosecaccesskey
	cd ${EXTERNAL_USERS_LOCATION} && time terraform destroy

destroy-groups:
	export AWS_PROFILE=dragosecaccesskey
	cd ${GROUP_LOCATION} && time terraform destroy


create-all: create-group create-internal-users create-external-users



