#!/bin/bash

set -e

# MYNA_ENV or input parameter env must be specified before execute this program
if [[ -z $MYNA_ENV ]]
then
    MYNA_ENV=$1
	if [ "$MYNA_ENV" == null -o "$MYNA_ENV" == "" ]
		then 
    	printf "%b\n" "ERROR: MYNA_ENV environment variable or input parameter env must be specified."
    	printf "%b\n" "INFO: Usage: $0 {on-prem|dev|qa|ppe|prod} {fis|bulk|myna|rules|security}"
    exit 1
	else
		printf "%b\n" "INFO: MYNA_ENV environment variable is not specified, will use the input parameter $MYNA_ENV"
	fi
else
    printf "%b\n" "INFO: MYNA_ENV=$MYNA_ENV"
fi

# MYNA_SCHEMAS or input parameter schemas must be specified before execute this program
if [[ -z $MYNA_SCHEMAS ]]
then
    MYNA_SCHEMAS=$2
	if [ "$MYNA_SCHEMAS" == null -o "$MYNA_SCHEMAS" == "" ]
		then 
    	printf "%b\n" "ERROR: MYNA_SCHEMAS environment variable or input parameter schemas must be specified."
    	printf "%b\n" "INFO: Usage: $0 {on-prem|dev|qa|ppe|prod} {fis|bulk|myna|rules|security}"
    exit 1
	else
		printf "%b\n" "INFO: MYNA_SCHEMAS environment variable is not specified, will use the input parameter $MYNA_SCHEMAS"
	fi
else
    printf "%b\n" "INFO: MYNA_SCHEMAS=$MYNA_SCHEMAS"
fi

# start mvn migrate
printf "%b\n" "INFO: starting migrate Myna flyway..."
cd ../$MYNA_SCHEMAS
mvn flyway:migrate -Duser.timezone=UTC -P $MYNA_ENV
