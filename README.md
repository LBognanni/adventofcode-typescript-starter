# Advent of code Typescript Starter

A simple [Advent of code](https://adventofcode.com/) starter project with Typescript and jest for testing.

## How to use

For each day, where `X` is the day number (1-25):

 - Call `./scripts/new_day.sh X`
 - Call `./scripts/fetch_input.sh X`
 - Implement the necessary logic in `solveForPart1` and `solveForPart2`
 - Import `dayX` in `index.ts` and add to the days array
 - `npm run start X` to run the day's test
 - `npm test` to run your tests

## Credits

Some code was liberally taken from https://github.com/stemmlerjs/simple-typescript-starter after some serious head-desking
