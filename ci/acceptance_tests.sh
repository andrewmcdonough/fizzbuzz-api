#!/bin/sh -e

response=$(curl -f -H "API_KEY: $API_KEY" ${API_ENDPOINT}/fizzbuzz/4)

if [ "$response" = "4" ]; then
  echo "ok"
else
  echo "fail, response was: $response"
  exit 1
fi
