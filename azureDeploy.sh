#!/bin/bash 
#Azure CLI Delpoyment Script

#Login to Azure
#az login

#Create Resource Group
RG="PlayWithDocker"
LOC="eastus2"

az group create --name $RG --location $LOC
az group deployment create --resource-group $RG --template-file "azuredeploy.json" --parameters "@azuredeploy.parameters.json"