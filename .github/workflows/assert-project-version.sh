#!/bin/bash

pomFile=$1
expectedVersion=$2

projectVersion=$(mvn -B help:evaluate -Dexpression=project.version -q -DforceStdout --file ${pomFile})
if [[ $projectVersion == "${expectedVersion}" ]]; then
    echo "Version is correct: '${expectedVersion}'"
else
    echo "Bad version! Expected '${expectedVersion}' but was '$projectVersion'"
    exit 1
fi
