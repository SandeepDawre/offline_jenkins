#!/bin/bash


if [[ ${params.IS_TRUE} == "true" ]]
then
        echo "Hello ${params.NAME} ${params.LAST_NAME} . Welcome to the DevOps Club."
else
        echo "Please check the parameters"
fi
