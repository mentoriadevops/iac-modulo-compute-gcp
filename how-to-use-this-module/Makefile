SHELL	 = /bin/bash

cnf ?= .env
ifneq ($(shell test -e $(cnf) && echo -n yes),yes)
	ERROR := $(error $(cnf) file not defined in current directory)
endif

include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

ifneq ($(shell test -e $(INCLUDE_MAKEFILE) && echo -n yes),yes)
	ifdef REMOTE_MAKEFILE
		REMOTE_MAKEFILE_RESULT := $(shell curl ${REMOTE_MAKEFILE} -o ${INCLUDE_MAKEFILE})
	else
		ERROR := $(error REMOTE_MAKEFILE not provided, look for your .env file)
	endif
endif

ifdef INCLUDE_MAKEFILE
	include ${INCLUDE_MAKEFILE}
endif

auth-create-sa: ## 1: Cria ServiceAccount
	gcloud iam service-accounts create ${GCP_TERRAFORM_SA} \
		--project ${GCP_PROJECT} \
		--description="Terraform Service Account" \
		--display-name="Terraform Service Account"

auth-create-iam-policy: ## 2: Cria Policy 1
	gcloud projects add-iam-policy-binding ${GCP_PROJECT} \
    --member=serviceAccount:${GCP_TERRAFORM_SA}@${GCP_PROJECT}.iam.gserviceaccount.com \
    --role=roles/compute.instanceAdmin.v1

auth-create-add-policy: ## 3: Cria policy 2
	gcloud projects add-iam-policy-binding ${GCP_PROJECT} \
    --member=serviceAccount:${GCP_TERRAFORM_SA}@${GCP_PROJECT}.iam.gserviceaccount.com \
    --role=roles/iam.serviceAccountUser

auth-create-creds-file: ## 4: Gera arquivo de autenticação do google GCP
	gcloud iam service-accounts \
		keys create key.json \
		--iam-account=${GCP_TERRAFORM_SA}@${GCP_PROJECT}.iam.gserviceaccount.com
