#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo -e "\n\n~~Welcome to Jacob's Guessing Game~~.\n\n"

BEST_GAME=1000  # Initialize BEST_GAME as a global variable

LOGIN() {
  echo -e "\nEnter your username:"
  read USERNAME

  USER_EXIST_RESULT=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username='$USERNAME';")
  
  if [[ -z $USER_EXIST_RESULT ]]
    then
      CREATE_ACCOUNT "$USERNAME"
  else
    echo "$USER_EXIST_RESULT" | while IFS='|' read -r DB_USERNAME GAMES_PLAYED CURRENT_BEST_GAME
     do
      echo -e "\nWelcome back, $DB_USERNAME! You have played $GAMES_PLAYED games, and your best game took $CURRENT_BEST_GAME guesses.\n"
      BEST_GAME=$CURRENT_BEST_GAME
    done
    GAME
  fi
}

CREATE_ACCOUNT() {
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username,games_played,best_game) VALUES('$1', '0', '$BEST_GAME');")

  if [[ $INSERT_USER_RESULT == "INSERT 0 1" ]]
  then
    echo "Welcome, $1! It looks like this is your first time here."
  else
    echo -e "\nUnable to create account.\n"
  fi
}

GAME() {
  RANDOM_NUMBER=$((1 + $RANDOM % 1000))
  USERS_GUESS_COUNT=1;

  echo -e "\nGuess the secret number between 1 and 1000:"
  read USERS_GUESS

  while [[ ! $USERS_GUESS =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read USERS_GUESS
  done

  while [ $USERS_GUESS -ne $RANDOM_NUMBER ] 
  do
    if [[ $RANDOM_NUMBER -lt $USERS_GUESS ]] 
      then
      echo -e "\nIt's lower than that, guess again:"
    elif [[ $RANDOM_NUMBER -gt $USERS_GUESS ]] 
      then
      echo -e "\nIt's higher than that, guess again:"
    fi
    
    read USERS_GUESS
    
    while [[ ! $USERS_GUESS =~ ^[0-9]+$ ]] 
    do
      echo "That is not an integer, guess again:"
      read USERS_GUESS
    done

    ((USERS_GUESS_COUNT++))
  done

  if [[ $USERS_GUESS_COUNT -lt $BEST_GAME ]] 
  then
    INSERT_NEW_BEST=$($PSQL "UPDATE users SET best_game = $USERS_GUESS_COUNT WHERE username='$USERNAME';")
    
    if [[ $INSERT_NEW_BEST == "UPDATE 1" ]] 
    then
      echo -e "\nBest game has been updated\n"
    else
      echo -e "\nBest game could not be updated\n"
    fi
  fi

   INSERT_NEW_GAME=$($PSQL "UPDATE users SET games_played = (games_played+1) WHERE username='$USERNAME';")

  echo -e "\nYou guessed it in $USERS_GUESS_COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!\n"
}

LOGIN
