#!/bin/bash

NAME=${params.NAME}
LAST_NAME=${params.LAST_NAME}
IS_TRUE=${params.IS_TRUE}

if [[ $IS_TRUE == "true" ]]
then
        echo "Hello $NAME $LAST_NAME . Welcome to the DevOps Club."
else
        echo "Please check the parameters"
fi
