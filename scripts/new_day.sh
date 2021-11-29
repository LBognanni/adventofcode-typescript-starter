#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'

YEAR=2021
DAY=$1

if [[ -z $DAY ]]; then
  echo -e "${RED}Usage: $0 <day>${NC}"
  exit 1
fi

if [[ $DAY -lt 1 || $DAY -gt 25 ]]; then
  echo -e "${RED}Please enter a day between 1-25.${NC}"
  exit 1
fi

INPUT_DAY=$(printf "%02d" $DAY)
TRIMMED_DAY=$(echo "$DAY" | sed "s/^0//g")

if [[ ! -f "./src/day${INPUT_DAY}/index.ts" ]]; then
  mkdir -p ./src/day$INPUT_DAY/
  npm run --silent hbs -- -D "{\"XX\": $TRIMMED_DAY}" -s ./src/day0/index.ts.template > ./src/day$INPUT_DAY/index.ts
  npm run --silent hbs -- -D "{\"XX\": $TRIMMED_DAY}" -s ./src/day0/day0.spec.ts.template > ./src/day$INPUT_DAY/day${INPUT_DAY}.spec.ts

else
  echo "Solution file exists, humbly declining to create"
fi
