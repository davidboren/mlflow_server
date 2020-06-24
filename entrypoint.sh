#!/usr/bin/env bash

DB_URI=postgresql+psycopg2://$MLFLOW_USERNAME:$MLFLOW_PASSWORD@$MLFLOW_RDS_ENDPOINT/$MLFLOW_DATABASE
# mlflow db upgrade $DB_URI
mlflow server --host --default-artifact-root $MLFLOW_ARTIFACT_ROOT --backend-store-uri $DB_URI
