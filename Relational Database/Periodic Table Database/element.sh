#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
if [[ $1 ]]
then
  # check if input is a number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # check atomic number
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1;")
  else
    # check name and symbol
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1' OR name='$1';")
  fi

  if [[ ! -z $ATOMIC_NUMBER ]]
  then
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER;")
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER;")
    TYPE=$($PSQL "SELECT type FROM properties INNER JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER;")
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")
    echo "The element with atomic number $(echo $ATOMIC_NUMBER | sed -E 's/^ *| *$//g') is $(echo $NAME | sed -E 's/^ *| *$//g') ($(echo $SYMBOL | sed -E 's/^ *| *$//g')). It's a $(echo $TYPE | sed -E 's/^ *| *$//g'), with a mass of $(echo $ATOMIC_MASS | sed -E 's/^ *| *$//g') amu. $(echo $NAME | sed -E 's/^ *| *$//g') has a melting point of $(echo $MELTING_POINT | sed -E 's/^ *| *$//g') celsius and a boiling point of $(echo $BOILING_POINT | sed -E 's/^ *| *$//g') celsius."
  else
    echo "I could not find that element in the database."
  fi
else
  echo -e "Please provide an element as an argument."
fi
