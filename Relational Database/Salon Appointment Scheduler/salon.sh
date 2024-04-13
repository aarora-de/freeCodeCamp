#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "\nWelcome to My Salon, how can I help you?\n"
  fi
  # Display services
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
    do
      echo "$SERVICE_ID) $NAME"
    done
  # read Input
  read SERVICE_ID_SELECTED

  # if input is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    # send to main menu
    MAIN_MENU "That is not a valid service number. What would you like today?"
  else
    # get service name
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
    # If not valid input
    if [[ -z $SERVICE_NAME ]]
    then
      # Send to Main Menu
      MAIN_MENU "I could not find that service. What would you like today?"
    else
      # Ask for phone number
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      # Check if customer exists in DB
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
      # If customer does not exist
      if [[ -z $CUSTOMER_NAME ]]
      then
        # Ask for name
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        # Insert into customers table
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE');")
      fi

      # Ask for time
      echo -e "\nWhat time would you like your $(echo $SERVICE_NAME | tr [:upper:] [:lower:]), $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')?"
      read SERVICE_TIME
      # Insert into appointments table
      # Get customer id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
      INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
      
      # Final Output
      echo -e "\nI have put you down for a $(echo $SERVICE_NAME | tr [:upper:] [:lower:]) at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')."
    fi
  fi
}

MAIN_MENU