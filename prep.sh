#!/bin/bash
echo "Input Project_ID:"
read project_name
echo "Input service account P12 key path:"
read p12key_path

gcloud compute --project $project_name instances create "ansible-master" --zone "us-central1-b" --machine-type "g1-small" --network "default" --maintenance-policy "MIGRATE" --scopes "https://www.googleapis.com/auth/userinfo.email" "https://www.googleapis.com/auth/compute" "https://www.googleapis.com/auth/devstorage.full_control" --tags "http-server" "https-server" --image "https://www.googleapis.com/compute/v1/projects/centos-cloud/global/images/centos-7-v20140926" --no-boot-disk-auto-delete
openssl pkcs12 -in $p12key_path -passin pass:notasecret -nodes -nocerts | openssl rsa -out gce-key.pem
gcutil --permit_root push gce-key.pem /root
gcloud compute ssh ansible