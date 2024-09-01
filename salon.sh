#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  echo -e "Welcome to My Salon, how can I help you?\n"

  # get services
  SERVICES_RESULT=$($PSQL "SELECT service_id, name FROM services")
  
  # display services
  echo "$SERVICES_RESULT" | sed 's/|/) /' 
  SERVICES_IDS=($(echo "$SERVICES_RESULT | sed 's/^([0-9]+).*/\1/'"))
  echo $SERVICES_IDS
  # read input
  read SERVICE_ID_SELECTED

  # if not valid
  if ! [[ $SERVICE_ID_SELECTED ~= '^[0-9]+$' ]]
  then 
    echo -e "\nI could not find that service. What would you like today?"
    # display services again
  else 
    # if not available
    
    # echo -e "\nI could not find that service. What would you like today?"  
    # display services again
    # if valid collect phone number
    #  get name from db if exists 
    # or create customer after prompting for name
  fi
  
  
  
  
}

MAIN_MENU 
