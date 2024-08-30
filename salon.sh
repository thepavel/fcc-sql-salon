#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  echo -e "Welcome to My Salon, how can I help you?\n"

  # get services
  SERVICES_RESULT=$($PSQL "SELECT service_id, name FROM services")
  echo "$($PSQL "SELECT service_id, name FROM services")" | sed 's/|/) /'

  # display services
  # read input
  # if not valid 
  # echo -e "\nI could not find that service. What would you like today?"
  # display services again
  # if valid collect phone number
  # get name from db if exists 
  # or create customer after prompting for name
  
}

MAIN_MENU 
