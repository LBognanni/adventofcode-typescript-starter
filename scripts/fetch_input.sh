#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'

YEAR=2021
SESSION=$(cat .cookie)

if [[ -z "${SESSION}" ]]; then
  echo -e "${RED}Error fetching credentials, add your session token to .cookie${NC}"
  exit 1
fi

if [[ -z $1 ]]; then
  echo -e "${RED}Usage: $0 <day>${NC}"
  exit 1
fi

if [[ $1 -lt 1 || $1 -gt 25 ]]; then
  echo -e "${RED}Please enter a day between 1-25.${NC}"
  exit 1
fi

DAY=$(echo "$1" | sed "s/^0//g")

if [[ ! -f "inputs/day${DAY}/part1.txt" ]]; then
  mkdir -p "inputs/day${DAY}"
  curl --cookie "session=${SESSION}" https://adventofcode.com/${YEAR}/day/${DAY}/input > inputs/day${DAY}/part1.txt 2>/dev/null
  cp inputs/day${DAY}/part1.txt inputs/day${DAY}/part2.txt
else
  echo "Input file exists, humbly declining to fetch"
fi
