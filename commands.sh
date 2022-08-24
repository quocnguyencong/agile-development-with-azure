#!/usr/bin/env bash

#create ssh key
echo "create ssh key"
ssh-keygen -t rsa -b 2048

#clone repo to local folder
echo "clone repo"
git clone https://github.com/quocnguyencong/agile-development-with-azure.git

#go inside repo folder
cd agile-development-with-azure

#create python venv
echo "create python venv"
python3 -m venv ~/.agile-development-with-azure
source ~/.agile-development-with-azure/bin/activate

echo "run make all"
make all

#run application locally
echo "run application"
export FLASK_APP=app.py
flask run

#verify is local app running well
echo "verify local API"
chmod +xr ./make_prediction.sh
./make_prediction.sh

# Create a resource group if you have not created yet
az group create -l eastasia -n udacity-resource-group-test

# Deploy app to Azure App Services
az webapp up -n housing-predition-flask-app --resource-group udacity-resource-group-test

echo "housing-predition-flask-app deployed Successfully"

echo "verify app API"
chmod +xr ./make_predict_azure_app.sh
./make_predict_azure_app.sh
