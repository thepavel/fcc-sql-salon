#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  echo -e "Welcome to My Salon, how can I help you?\n"

  # get services
  SERVICES_RESULT=$($PSQL "SELECT service_id, name FROM services")
  
  # display services
  echo "$(echo "$SERVICES_RESULT" | sed 's/|/) /')"
  echo "$SERVICES_RESULT" | sed 's/|/) /' # we need a list of available services to validate the input against
  
  # read input
  #read SELECTED_SERVICE_ID
  
  # if not valid 
  

  # echo -e "\nI could not find that service. What would you like today?"
  # display services again
  # if valid collect phone number
  # get name from db if exists 
  # or create customer after prompting for name
  
}

MAIN_MENU 
