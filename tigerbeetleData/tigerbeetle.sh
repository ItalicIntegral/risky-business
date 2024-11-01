#!/bin/bash

# WARNING
# Don't blindly run scripts you find online.
# That's dangerous and stupid.

# does this script have execute permission?
# ls -l
# If unsure how to tell, use your web browser and learn.
# https://www.howtouselinux.com/post/check-file-permissions-in-linux

# end execution
# exit 1

logFile="./tigerbeetle.log"
echo > $logFile
msg="My initial global message."

log () {
  local msg=$1
  # local msg="My local message."
  # echo "$msg"
  # echo "$msg" 2>&1 | tee -a $logFile
  echo "$(date '+%H:%M:%S')" "$msg" | tee -a $logFile
  return 0
}

# test log function
log $logFile
# msg=""
# echo "$msg"
# echo "return: $?"

# test log function return output
# msg="my test log function message"
# functionResult=$(log "$msg")
# echo "functionResult: $functionResult"
# msg=""


# what time is it
# echo $(log "$(date '+%Y-%m-%d %H:%M:%S')")

# theDate=$(date '+%Y-%m-%d %H:%M:%S')
# echo "theDate: $theDate"
# functionResult=$(log "$theDate")
# echo "functionResult: $functionResult"

# functionResult2=$(log "$(date '+%Y-%m-%d %H:%M:%S')")
# echo "functionResult2: $functionResult2"

# log "Error! I don't want you to run this script."
# exit 1

# remove execute permission from this script. 
# chmod -x ./tigerbeetle.sh


# check if you are root
# Some of these commands might require root
if [ $(whoami) != 'root' ]; then
  log "You are not root."
  log "These scripts must run as root."
  exit 1
else
  log "You are root."
fi

# Ask for permision to run.
echo "These scripts must run as root."
echo "These scripts could damage your system."
echo ""
read -p "Do you want to continue? [Y/n] " -n 1 -r
# echo    # (optional) move to a new line
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  log "User '$USER' chose to continue"
else
  log "User '$USER' did not choose to continue"
fi
echo


# download latest release of TigerBeetle (linux)
# (statically-linked library)
# curl -Lo tigerbeetle.zip https://linux.tigerbeetle.com && unzip tigerbeetle.zip && ./tigerbeetle version
# ./tigerbeetle version

# note:
# Building tigerbeetle from source is not recommended.


# Define example database
# environment="0_0"
# databaseName="my-business-name"
# databasePath="$environment.$databaseName"

# create example tigerbeetle database
# https://docs.tigerbeetle.com/quick-start
# ./tigerbeetle format --cluster=0 --replica=0 --replica-count=1 --development "$databasePath"

# start tigerbeetle cluster
# sudo ./tigerbeetle start --addresses=3000 --development "./0_0.my-business-name"

# connect to database via REPL
# ./tigerbeetle repl --cluster=0 --addresses=3000

# Create some accounts
# create_accounts id=1 code=10 ledger=700 flags=linked | history,
#                 id=2 code=10 ledger=700;

# Create some transfers
# create_transfers id=1 debit_account_id=1 credit_account_id=2 amount=10 ledger=700 code=10;

# Get account transfers
# get_account_transfers account_id=1 flags=debits|credits;

# Get account balances
# get_account_balances account_id=1 flags=debits|credits;

# Lookup accounts
# lookup_accounts id=1, id=2;


# Create example chart of accounts
# https://www.enkel.ca/blog/bookkeeping/chart-of-accounts-101-a-guide-for-canadian-business-owners/


# Account Type: Assets
# 1020 - Inventory
# create_accounts id=1020 code=10 ledger=700;
# 1000 - Cash
# create_accounts id=1000 code=10 ledger=700;
# 1010 - Accounts Receivables
# create_accounts id=1010 code=10 ledger=700;


# Account Type: Liabilities
# 2030 - Taxes Payable
# 2000 - Accounts Payable
# 2010 - Credit Card Payable
# 2020 - Business Loans


# Account Type: Equity
# 3000 - Owner's Equity
# 3010 - Retained Earnings
# 3020 - Preferred Stock
# 3040 - Retained Earnings


# Account Type: Revenue
# 4000 - Sales Revenue
# 4010 - Service Revenue

# Account Type: Expenses
# 5070 - Utilities Bills
# 5000 - Cost of Goods Sold
# 5010 - Rent Expense
# 5020 - Utilities Expense
# 5030 - Payroll
# 5040 - Rent
# 5050 - Travel Expenses
# 5060 - Depreciation


# Next challenge. Coding for tigerbeetle
# https://docs.tigerbeetle.com/coding/
# https://www.p99conf.io/session/a-deterministic-walk-down-tigerbeetles-main-street/
