# Covid Alert Server Manual Reporting

Please note this is a temporary repository and it is not expected to be here forever. 

This contains the scripts that are used to generate daily reports on in-app metrics and are meant to be uploaded to google drive for consumption by reports generated there. 

CSV files will go in the "CDS Exposure Notification/1. Server Team/reports/data" folder.

This is meant to run in a VS Code Dev Container, however it can also be run locally if you want to run it outside of a container it is recommended that you setup a python virtual environment and installing the requirements by running the following command in the base of the project.

```sh
python3 -m venv ./env && ./bin/init.sh
```
To run generate the reports run 

```sh 
make reports
```
