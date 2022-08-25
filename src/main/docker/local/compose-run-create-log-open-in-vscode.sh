#!/usr/bin/env bash

# Author: Ronnen Nagal
# Date: Aug 08,2021
# Date Modified: Aug 08,2021
clear

# Statement to the User
echo
echo Script to run docker-compose-up on a compose.yaml file,
echo save the log to docker-compose.log, and open it with vscode.
echo

# Variables

# set the docker-compose file location to a variable (modify to your compose-file-location)
compose_file_path=/Users/ronnen/Sync/Dev/SpringMicroservices/mssc-beer-service/src/main/docker/local/compose.yaml

# Execution

# cd into the docker-compose.yaml directory, exit if fail. (modify to your compose-file-location)
cd /Users/ronnen/Sync/Dev/SpringMicroservices/mssc-beer-service/src/main/docker/local || exit

# run docker-compose-up from its directory location, on the compose yaml file its location defined above
/usr/local/bin/docker-compose -f $compose_file_path up -d

# pause the script for 90 seconds
echo
echo pausing the script for 90 seconds... to generate enough logs.
echo

/bin/sleep 90

# saves the execution log(s) to a .log file (in the current directory)
docker-compose logs > docker-compose.log

# define the 'code' var, to open the log with vscode in the next step
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# open the file in vscode
code docker-compose.log

echo
echo End of Script

