#!/bin/bash

if [ $# -ne 4 ]
then
  echo "Usage: ./describe-tables.sh <aws-profile> <prefix> <env> <host>"
  echo "Example: ./describe-tables.sh local-dynamodb kari-sseks dev localhost"
  exit 1
fi

MY_AWS_PROFILE=$1
MY_PREFIX=$2
MY_ENV=$3
MY_HOST=$4

if [ "$MY_AWS_PROFILE" == "local-dynamodb" ]; then
  MY_ENDPOINT="--endpoint-url http://${MY_HOST}:8000"
else
  MY_ENDPOINT=""
fi

MY_SESSION_TABLE="${MY_PREFIX}-${MY_ENV}-session"
MY_USERS_TABLE="${MY_PREFIX}-${MY_ENV}-users"
MY_PRODUCT_GROUP_TABLE="${MY_PREFIX}-${MY_ENV}-product-group"
MY_PRODUCT_TABLE="${MY_PREFIX}-${MY_ENV}-product"


echo "************  Describe tables  ************"
echo "Using AWS profile: $MY_AWS_PROFILE"

AWS_PROFILE=$MY_AWS_PROFILE aws dynamodb describe-table $MY_ENDPOINT --table-name $MY_SESSION_TABLE
AWS_PROFILE=$MY_AWS_PROFILE aws dynamodb describe-table $MY_ENDPOINT --table-name $MY_USERS_TABLE
AWS_PROFILE=$MY_AWS_PROFILE aws dynamodb describe-table $MY_ENDPOINT --table-name $MY_PRODUCT_GROUP_TABLE
AWS_PROFILE=$MY_AWS_PROFILE aws dynamodb describe-table $MY_ENDPOINT --table-name $MY_PRODUCT_TABLE
