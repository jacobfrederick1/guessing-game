#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --tuples-only --no-align -c"

SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))

echo "Enter your username:"
read USERNAME

SEARCH_USERNAME=$($PSQL "SELECT username FROM players WHERE username = '$USERNAME'")

if [[ -z $SEARCH_USERNAME ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

  SAVE_USERNAME=$($PSQL "INSERT INTO players(username, games_played) VALUES('$USERNAME', 0)")
else

  GAMES_PLAYED=$($PSQL "SELECT games_played FROM players WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM players WHERE username='$USERNAME'")
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo -e "\nGuess the secret number between 1 and 1000:"

NUMBER_OF_GUESSES=0

while [[ $NUMBER_GUESS != $SECRET_NUMBER ]]
do
  
  read NUMBER_GUESS

  if [[ ! $NUMBER_GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
  

  else
    if [[ $NUMBER_GUESS > $SECRET_NUMBER ]]
    then
      echo -e "\nIt's lower than that, guess again:"

    elif [[ $NUMBER_GUESS < $SECRET_NUMBER ]]
    then
      echo -e "\nIt's higher than that, guess again:"

    fi
  fi
  NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES+1))
done

echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

UPDATE_GAMES_PLAYED=$($PSQL "UPDATE players set games_played = games_played+1 WHERE username = '$USERNAME'")
UPDATE_BETST_GAME=$($PSQL "UPDATE players SET best_game = $NUMBER_OF_GUESSES WHERE username = '$USERNAME' AND (best_game IS NULL OR best_game > $NUMBER_OF_GUESSES)")
