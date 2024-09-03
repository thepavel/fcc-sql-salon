#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

FINISHED=false

PRINT_SERVICES() {
  # get services
  SERVICES_RESULT=$($PSQL "SELECT service_id, name FROM services")
  
  # display services
  echo -e "\n$1"
  echo "$SERVICES_RESULT" | sed 's/|/) /' 
}

GET_SERVICE_SELECTION() {
  PRINT_SERVICES
  # read input
  read SERVICE_ID_SELECTED

  if [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]] # it's a number - basic validation
  then 
    SERVICE_RESULT=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    echo $SERVICE_RESULT

    if [[ -z $SERVICE_RESULT ]]
    then
      echo -e "\nI could not find that service. What would you like today?"  
    else 
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE

      CUSTOMER_RESULT=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      echo $CUSTOMER_RESULT

      if [[ -z $CUSTOMER_RESULT ]]
      then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
      else
        CUSTOMER_NAME="$CUSTOMER_RESULT"
      fi

      echo -e "\nWhat time would you like your ${SERVICE_RESULT}, ${CUSTOMER_NAME}?"
      read SERVICE_TIME

      echo -e "\nI have put you down for a ${SERVICE_RESULT} at ${SERVICE_TIME}, ${CUSTOMER_NAME}."
      
    fi
  else 
    if [[ "$SERVICE_ID_SELECTED" = "exit" ]]
    then 
      FINISHED="true"
    else 
      echo -e "\nI could not find that service. What would you like today?"
    fi
  fi

  # # if not valid
  # if [[ $SERVICE_ID_SELECTED =~ '^[0-9]+$' ]]
  # then 
    
  #   # display services again
  #   # if not available
  #   # echo -e "\nI could not find that service. What would you like today?"  
  #   # display services again
  #   # if valid collect phone number
  #   #  get name from db if exists 
  #   # or create customer after prompting for name
  # fi

}

while [ "$FINISHED" != "true"  ]; do
  GET_SERVICE_SELECTION 
done
