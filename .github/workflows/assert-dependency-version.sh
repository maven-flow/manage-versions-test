#!/bin/bash

pomFile=$1
groupId=$2
artifactId=$3
expectedVersion=$4

dependencies=$(mvn dependency:list -DincludeArtifactIds=${artifactId} --file ${pomFile})

expectedDependency="${groupId}:${artifactId}:jar:${expectedVersion}:"

if [[ $dependencies == *"$expectedDependency"* ]]; then
    echo "Found expected value '$expectedDependency'."
else
    echo "ERROR: expected value '$expectedDependency' not found."
    echo "All dependencies: "
    echo "$dependencies"
    exit 1
fi
