# REST API - Banking Application

This is a Rails application called "VisableBank". The application performs basic banking operations like money transfers and showing of current account balance.

The DB consists of bank accounts with transactions and balance, wired by a service class to create transactions and transfer money. 
All implementation is about the backend part - no authentication or UI.

## Main Endpoints

1. REST endpoint to show the balance of the account and 10 latest transactions.
2. REST endpoint to transfer money between accounts making use of a service class called TransactionManager.


## Install

In your terminal run:

`bundle install` 

`yarn install`

`rails db:create db:migrate db:seed`

## Run the app

In your terminal run:

`rails s`

## Run the tests

`rspec`


# REST API

The REST API to the banking app is described below.

## Get a specific Thing

### Request

`GET /accounts/:id`

    curl -i -H 'Accept: application/json' http://localhost:3000/acconts/1

### Response

    HTTP/1.1 200 OK
    Date: Wed, 18 Jan 2023 12:36:30 GMT
    Status: 200 OK
    Connection: close
    Content-Type: application/json
    Content-Length: xx

`{
  "account": {
  "id": 1,
  "iban": "DE72894208793284351756",
  "bic": "BARBGB2LKIL",
  "client": "Gavin Mitchell",
  "balance": 52301.0,
  "created_at": "2023-01-14T19:07:32.465Z",
  "updated_at": "2023-01-16T21:35:44.322Z"
  },
  "balance": 52301.0,
  "transactions": [
    {
    "id": 93,
    "transaction_date": "2023-01-16T00:00:00.000Z",
    "amount": 90.0,
    "transaction_type": "transfer",
    "iban": "DE38673556975189380090",
    "transaction_status": "approved",
    "created_at": "2023-01-16T21:35:44.332Z",
    "updated_at": "2023-01-16T21:35:44.332Z",
    "account_id": 1
    },
    {
    "id": 92,
    "transaction_date": "2023-01-16T00:00:00.000Z",
    "amount": 90.0,
    "transaction_type": "transfer",
    "iban": "DE38673556975189380090",
    "transaction_status": "declined",
    "created_at": "2023-01-16T21:34:44.485Z",
    "updated_at": "2023-01-16T21:34:44.485Z",
    "account_id": 1
    },
    {
    "id": 91,
    "transaction_date": "2023-01-16T00:00:00.000Z",
    "amount": 90000.0,
    "transaction_type": "transfer",
    "iban": "DE38673556975189380090",
    "transaction_status": "declined",
    "created_at": "2023-01-16T21:34:33.583Z",
    "updated_at": "2023-01-16T21:34:33.583Z",
    "account_id": 1
    },
    {
    "id": 90,
    "transaction_date": "2023-01-16T00:00:00.000Z",
    "amount": 90000.0,
    "transaction_type": "transfer",
    "iban": "DE38673556975189380090",
    "transaction_status": "declined",
    "created_at": "2023-01-16T21:33:45.674Z",
    "updated_at": "2023-01-16T21:33:45.674Z",
    "account_id": 1
    },
    {
    "id": 89,
    "transaction_date": "2023-01-16T00:00:00.000Z",
    "amount": 90000.0,
    "transaction_type": "withdraw",
    "iban": "DE38673556975189380090",
    "transaction_status": "declined",
    "created_at": "2023-01-16T21:33:36.973Z",
    "updated_at": "2023-01-16T21:33:36.973Z",
    "account_id": 1
    },
    {
    "id": 88,
    "transaction_date": "2023-01-16T00:00:00.000Z",
    "amount": 90000.0,
    "transaction_type": "withdraw",
    "iban": "DE38673556975189380090",
    "transaction_status": "declined",
    "created_at": "2023-01-16T20:43:53.991Z",
    "updated_at": "2023-01-16T20:43:53.991Z",
    "account_id": 1
    },
    {
    "id": 87,
    "transaction_date": "2023-01-14T00:00:00.000Z",
    "amount": 90000.0,
    "transaction_type": null,
    "iban": "DE38673556975189380090",
    "transaction_status": "canceled",
    "created_at": "2023-01-14T22:34:07.567Z",
    "updated_at": "2023-01-14T22:34:07.567Z",
    "account_id": 1
    },
    {
    "id": 86,
    "transaction_date": "2023-01-14T00:00:00.000Z",
    "amount": 90000.0,
    "transaction_type": null,
    "iban": "DE38673556975189380090",
    "transaction_status": "declined",
    "created_at": "2023-01-14T22:31:33.621Z",
    "updated_at": "2023-01-14T22:31:33.621Z",
    "account_id": 1
    },
    {
    "id": 85,
    "transaction_date": "2023-01-14T00:00:00.000Z",
    "amount": 90000.0,
    "transaction_type": "transfer",
    "iban": "DE38673556975189380090",
    "transaction_status": "declined",
    "created_at": "2023-01-14T22:31:03.854Z",
    "updated_at": "2023-01-14T22:31:03.854Z",
    "account_id": 1
    },
    {
    "id": 84,
    "transaction_date": "2023-01-14T00:00:00.000Z",
    "amount": 900.0,
    "transaction_type": "transfer",
    "iban": "DE38673556975189380090",
    "transaction_status": "approved",
    "created_at": "2023-01-14T22:28:10.145Z",
    "updated_at": "2023-01-14T22:28:10.145Z",
    "account_id": 1
    }
  ]
}`

## Create a new transaction

### Request

`POST /accounts/:id/transactions`
    
  `
  url:  http://localhost:3000/accounts/1/transactions
  method: 'POST'
  headers: {
    content-type: application/json,application/json
    accept: application/json
    accept-encoding: gzip, deflate
    accept-language: en-US,en;q=0.8
    user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36
  },
  body: {"amount":999,"transaction_type":"transfer","iban":"DE4412000001101724182"}`

### Response

    HTTP/1.1 201 Created
    Date:  Wed, 18 Jan 2023 12:36:30 GMT
    Status: 201 Created
    Connection: close
    Content-Type: application/json
    Location: /accounts/1/transactions/61
    Content-Length: 36

   `{
        "transaction": 
          {
            "id": 61,
            "transaction_date": "2023-01-18T00:00:00.000Z",
            "amount": 999,
            "transaction_type": "transfer",
            "iban": "DE4412000001101724182",
            "transaction_status": "approved",
            "created_at": "2023-01-18T10:22:45.067Z",
            "updated_at": "2023-01-18T10:22:45.067Z",
            "account_id": 1
          },
        "balance": 273256,
        "previous_balance": 274255
    }`





