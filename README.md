# Overview

In this project, you will build a Github repository from scratch and create a scaffolding that will assist you in performing both Continuous Integration and Continuous Delivery. You'll use Github Actions along with a Makefile, requirements.txt and application code to perform an initial lint, test, and install cycle. Next, you'll integrate this project with Azure Pipelines to enable Continuous Delivery to Azure App Service

## Project Plan

* A link to a Trello board for the project
* A link to a spreadsheet that includes the original and final project plan>

## Instructions

* Architectural Diagram
![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/building-a-ci-cd-pipeline.png)


<TODO:  Instructions for running the Python project.  How could a user with no context run this project without asking you for any help.  Include screenshots with explicit steps to create that work. Be sure to at least include the following screenshots:
* Setup Azure CLI
- Login https://portal.azure.com/ and go to cloud shell
- Create a ssh key to use for github authentication
![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/ssh-keygen.PNG)
- Add public key to github: https://github.com/settings/profile > SSH and GPG keys > new SSH key, add content of file id_rsa.pub to the textbox and save
![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/add%20ssh%20key%20to%20git.PNG)

* Project cloned into Azure Cloud Shell
![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/clone%20git%20project%20from%20azure%20CLI.PNG)

* Create the Python Virtual Environment
Inside your Azure Cloud Shell environment create a Python virtual environment to run the project
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
note: if you face with error "Permission Denied". You need to gand permission execute in make-prediton.sh by using command below
```bash
chmod +xr ./make-predition.sh
```


![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/flask-app-test-localhost-api.png)

# Deploy this application to azure app services
![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/az-webapp-up.png)

* Verify the site is running
![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/web-app-home.png)

* Verify the API
1. Change API url in file make_predict_azure_app.sh
![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/change-make-predict-azure.png)
2. Execute command in file make_predict_azure_app.sh
![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/execute-make-predict-azure.png)

## Configure GitHub Actions
* You will configure GitHub Actions to test your project upon change events in GitHub. This is a necessary step to perform Continuous Integration remotely
* To enable github action: go to your repo > Actions tab > New workflow > chose Python application > a yml file generated
![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/create%20git%20workflow%20for%20python%20app.png)
![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/edit%20git%20workflow.png)
* Edit with step as your exptected and run this workflow
![alt text](https://github.com/quocnguyencong/agile-development-with-azure/blob/main/screen-shot/github-action-test.PNG)



* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

* Running Azure App Service from Azure Pipelines automatic deployment

* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).
The output should look similar to this:

```bash
udacity@Azure:~$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
```

* Output of streamed log files from deployed application

> 

## Enhancements

<TODO: A short description of how to improve the project in the future>

## Demo 

<TODO: Add link Screencast on YouTube>


