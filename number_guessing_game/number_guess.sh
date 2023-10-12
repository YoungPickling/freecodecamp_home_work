#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"
RAND=$(( RANDOM % 1000 + 1 ))

MAIN_MENU() {
  echo "Enter your username:"
  read USERNAME

  USER_EXISTS=$($PSQL "SELECT username,games_played,best_game FROM users WHERE username='$USERNAME'")

  if [[ -z $USER_EXISTS ]]
  then

    CREATE_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  
  else

    read USERNAME BAR GAMES_PLAYED BAR BEST_GAME <<< "$USER_EXISTS"
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    
  fi

  GUESS_COUNTER=0

  SECRET_INPUT=2000
  echo "Guess the secret number between 1 and 1000:"

  while [[ $SECRET_INPUT != $RAND ]]
  do
    # guess the secret number
    read SECRET_INPUT

    if [[ ! $SECRET_INPUT =~ ^[0-9]+$ ]]
    then
      # if the input is not an integer
      echo "That is not an integer, guess again:"
      ((GUESS_COUNTER++))

    else

      if (( $RAND < $SECRET_INPUT ))
      then

        echo "It's lower than that, guess again:"
        ((GUESS_COUNTER++))

      elif (( $RAND > $SECRET_INPUT ))
      then
      
        echo "It's higher than that, guess again:"
        ((GUESS_COUNTER++))

      else 

        ((GUESS_COUNTER++))
        echo "You guessed it in $GUESS_COUNTER tries. The secret number was $RAND. Nice job!"

        GET_DATA=$($PSQL "SELECT games_played,best_game FROM users WHERE username='$USERNAME'")
        read GAMES_PLAYED BAR BEST_GAME <<< "$GET_DATA"

        ((GAMES_PLAYED++))

        if [[ $GUESS_COUNTER < $BEST_GAME || $BEST_GAME == 0 ]] ; then
          BEST_GAME=$GUESS_COUNTER
        fi

        UPDATE_STATS=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED , best_game=$BEST_GAME WHERE username='$USERNAME'")
      fi

    fi
  done
}

MAIN_MENU