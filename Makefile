build:
	cd terraform && \
		rm -rf .terraform && \
		terraform init -backend-config=kthw-backend.tfvars && \
		terraform plan -var-file=kthw.tfvars -var-file=kthw-backend.tfvars && \
		terraform apply -var-file=kthw.tfvars -var-file=kthw-backend.tfvars -auto-approve

destroy:
	cd terraform && \
		rm -rf .terraform && \
		terraform init -backend-config=kthw-backend.tfvars && \
		terraform plan -var-file=kthw.tfvars -var-file=kthw-backend.tfvars -destroy && \
		terraform destroy -var-file=kthw.tfvars -var-file=kthw-backend.tfvars