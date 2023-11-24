## Description

This repository provides a template for automatic provisioning of multi-environment branch-based infrastructure for Azure Functions and publising them via GitHub actions.

## Prerequisites
1. `GitHub CLI`
2. `Azure CLI`


## Set up Azure credentials and create storage for Terraform

run `set-up.sh` from `scripts` folder with `app name` as a first parameter. Ex: `./set-up.sh myapp`



## Add a new environment:

create a new workflow in `.github/workflows` folder and specify a branch name