# Overview

In this project, you will build a Github repository from scratch and create a scaffolding that will assist you in performing both Continuous Integration and Continuous Delivery. You'll use Github Actions along with a Makefile, requirements.txt and application code to perform an initial lint, test, and install cycle. Next, you'll integrate this project with Azure Pipelines to enable Continuous Delivery to Azure App Service

## Project Plan

* [Trello board](https://trello.com/b/GyznwqWu/housing-prediction-flask-app)
* [Spreadsheeet Project Plan](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/project-management-plan.xlsx)

## Instructions

###### Architectural Diagram
![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/building-a-ci-cd-pipeline.png)

###### Setup Azure CLI
- Login https://portal.azure.com/ and go to cloud shell
- Create a ssh key to use for github authentication
![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/ssh-keygen.PNG)
- Add public key to github: https://github.com/settings/profile > SSH and GPG keys > new SSH key, add content of file id_rsa.pub to the textbox and save
![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/add%20ssh%20key%20to%20git.PNG)

* Project cloned into Azure Cloud Shell
![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/clone%20git%20project%20from%20azure%20CLI.PNG)

* Create the Python Virtual Environment
- Inside your Azure Cloud Shell environment create a Python virtual environment to run the project
```bash
cd agile-development-with-azure
python3 -m venv ~/.agile-development-with-azure
source ~/.agile-development-with-azure/bin/activate
```

* Passing tests that are displayed after running the `make all` command from the `Makefile`
![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/run-make-all.PNG)

* Run application in local
```bash
export FLASK_APP=app.py
flask run
```

![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/flask-app-localhost-running.png)

* Verify local host is running well by using below commandline. Be make sure your localhost port same with PORT variable in make-predition.sh file
```bash
./make-predition.sh
```
**Note:** if you face with error "Permission Denied". You need to grant permission execute in make-prediton.sh by using command below
```bash
chmod +xr ./make-predition.sh
```

![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/flask-app-test-localhost-api.png)

# Deploy this application to azure app services
![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/az-webapp-up.png)

###### Verify the site is running
![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/web-app-home.png)

###### Verify the API
1. Change API url in file make_predict_azure_app.sh

![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/change-make-predict-azure.png)
2. Execute command in file make_predict_azure_app.sh

![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/execute-make-predict-azure.png)

## Configure GitHub Actions
* You will configure GitHub Actions to test your project upon change events in GitHub. This is a necessary step to perform Continuous Integration remotely
* To enable github action: go to your repo > Actions tab > New workflow > chose Python application > a yml file generated

![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/create%20git%20workflow%20for%20python%20app.png)

![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/edit%20git%20workflow.png)
* Edit this file with step as your exptected and run

![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/github-action-test.PNG)

## Continuous Delivery on Azure
* You are ready for the final step. It's time to set up Continuous Delivery using Azure technologies. This will involve setting up Azure Pipelines to deploy the Flask starter code to Azure App Services.

* Setup pipeline in dev.azure.com
1. Login to dev.azure.com same account with portal.azure.com and create a project

![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/dev.azure.com-create-project.png)

2. Add service connections to project has been created

![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/dev.azure.com-create-service-connection-step.png)

* Next

![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/dev.azure.com-create-service-connection.png)

* Result

![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/dev.azure.com-create-service-connection-created.png)

3. Create pipeline

![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/dev.azure.com-create-pipeline.png)
* In connect tab, select GitHub

![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/dev.azure.com-create-pipeline-connect.png)
* Select Repository

![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/dev.azure.com-create-pipeline-Select.png)
* Config pipline

![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/dev.azure.com-create-pipeline-configure.png)
![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/dev.azure.com-create-pipeline-select-azure-sub.png)
* Review YAML file and click "Save and Run"

![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/dev.azure.com-create-pipeline-preview.png)

** Notes:** I faced with some errors about Microsoft-hosted agents. Below is my solutions researched on google.

1. Hard code for vmImage insted of variable

![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/dev.azure.com-hardcode-vmImage.png)

2. Setup billing for Organization setting

![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/dev.azure.com-setup-billing.png)

* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/dev.azure.com-job-run-success.png)


**Note:** For now, any change on main branch of this repo will trigger the azure pipeline to deploy the change to azure App services

## Enhancements

* Refactor and structure code (find a good framework to apply)
* Apply micro service

## Demo 

![https://youtu.be/yN7Ong4T_LA](https://youtu.be/yN7Ong4T_LA)



