#!/usr/bin/env bash

DB_URI=postgresql+psycopg2://$MLFLOW_USERNAME:$MLFLOW_PASSWORD@$MLFLOW_SERVER/$MLFLOW_DATABASE
mlflow db upgrade $DB_URI
mlflow server --backend-store-uri $DB_URI
