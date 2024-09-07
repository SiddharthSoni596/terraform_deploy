gcloud auth login
#gcloud services enable compute.googleapis.com
#gcloud services list --enabled

gcloud auth login --no-launch-browser

gcloud config set project "<PROJECT_ID>"  

gcloud iam service-accounts create terraform --description="Terraform Service Account" --display-name="terraform"

export GOOGLE_SERVICE_ACCOUNT=`gcloud iam service-accounts list --format="value(email)"  --filter=description:"Terraform Service Account"` 

export GOOGLE_CLOUD_PROJECT=`gcloud info --format="value(config.project)"`

gcloud projects add-iam-policy-binding %GOOGLE_CLOUD_PROJECT% --member="serviceAccount:%GOOGLE_SERVICE_ACCOUNT%" --role="roles/editor" 

gcloud iam service-accounts keys create "./terraform.json"  --iam-account=%GOOGLE_SERVICE_ACCOUNT% 

gcloud iam service-accounts keys list  --iam-account=%GOOGLE_SERVICE_ACCOUNT% 

gcloud iam service-accounts keys delete  118017407601194981915  --iam-account=%GOOGLE_SERVICE_ACCOUNT% 

gcloud iam service-accounts add-iam-policy-binding %GOOGLE_IMPERSONATE_SERVICE_ACCOUNT% --member="user:%USER_ACCOUNT_ID%" --role="roles/iam.serviceAccountTokenCreator"  