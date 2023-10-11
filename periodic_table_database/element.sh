#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ACTION=$($PSQL "SELECT atomic_number,symbol,name,melting_point_celsius,boiling_point_celsius,type,atomic_mass FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
  else
    ACTION=$($PSQL "SELECT atomic_number,symbol,name,melting_point_celsius,boiling_point_celsius,type,atomic_mass FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1' OR name='$1'")
  fi


  if [[ -z $ACTION ]]
  then
    echo "I could not find that element in the database."
  else
    # echo "$ACTION" | read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR MELTING_POINT BAR BOILING_POINT BAR TYPE BAR ATOMIC_MASS
    read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR MELTING_POINT BAR BOILING_POINT BAR TYPE BAR ATOMIC_MASS <<< "$ACTION"

    echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."

  fi
fi

# cat atomic_mass.txt | while read ATOMIC_NUMBER BAR ATOMIC_MASS
# do
#   if [[ $ATOMIC_NUMBER != atomic_number ]]
#   then
#     ACTION_A=$($PSQL "UPDATE properties SET atomic_mass=$ATOMIC_MASS WHERE atomic_number=$ATOMIC_NUMBER")
#   fi
#   # 12345678
# done
