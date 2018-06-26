git config --global user.email "qinyujue@gmail.com"
git config --global user.name "Tim Qin"

gcloud compute --project $PROJECT_NAME instances create "ansible-master" --zone "us-central1-b" --machine-type "g1-small" --network "default" --maintenance-policy "MIGRATE" --scopes "https://www.googleapis.com/auth/userinfo.email" "https://www.googleapis.com/auth/compute" "https://www.googleapis.com/auth/devstorage.full_control" --tags "http-server" "https-server" --image "https://www.googleapis.com/compute/v1/projects/centos-cloud/global/images/centos-7-v20140926" --no-boot-disk-auto-delete
