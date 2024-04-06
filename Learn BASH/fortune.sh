#!/bin/bash

# Program to tell a persons fortune

echo -e "\n~~ Fortune Teller ~~\n"

RESPONSES=("Yes" "No" "Maybe" "Outlook good" "Don't count on it" "Ask again later")
N=$(( RANDOM % 6 ))

GET_FORTUNE() {
  if [[ ! $1 ]] # Condition to check if argument is passed while calling the function
  then
    echo Ask a yes or no question:
  else
    echo Try again. Make sure it ends with a question mark:
  fi
  read QUESTION
}

GET_FORTUNE # Call function the first time without any argument to print the first statement

until [[ $QUESTION =~ \?$ ]] #regex matching
do
  GET_FORTUNE again # Call function with an argument, so that it prints the else statement
done

echo -e "\n${RESPONSES[$N]}"
