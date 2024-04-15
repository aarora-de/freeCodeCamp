#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

# Check if username exists
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
# If not exists
if [[ -z $USER_ID ]]
then
  # Insert into table
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
  # Get new userid
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
  # Print welcome message
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
# If exists
  # Get game data
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id=$USER_ID;")
  BEST_GAME=$($PSQL "SELECT num_guesses FROM games WHERE user_id=$USER_ID ORDER BY num_guesses LIMIT 1;")
  # Print welcome message
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate Random number
SECRET_NUM=$(( RANDOM % 1001 ))
# Ask user input
echo "Guess the secret number between 1 and 1000:"
read GUESS
NUM_GUESS=1
# Keep asking till user guesses
while [[ $SECRET_NUM != $GUESS ]]
do
  # Check if input is a number
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read GUESS
  elif [[ $SECRET_NUM < $GUESS ]]
  then
    echo "It's lower than that, guess again:"
    read GUESS
    (( NUM_GUESS++ ))
  else
    echo "It's higher than that, guess again:"
    read GUESS
    (( NUM_GUESS++ ))
  fi
done
# When guessed right
# Insert game details into DB
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, number, num_guesses) VALUES($USER_ID, $SECRET_NUM, $NUM_GUESS);")
# Print final message
echo "You guessed it in $NUM_GUESS tries. The secret number was $SECRET_NUM. Nice job!"
