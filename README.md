# csec464-project

 Forensics Final Project - CSEC464

## Running

* Edit the `docker-compose.yml` environment variables to your settings
* `docker-compose up --build -d`

## Env Vars

### Server Vars

* `("REDIS_HOST", "redis")`
* `("REDIS_PORT", "6379")`
* `("REDIS_PASSWORD", "")`
* `("COMPANY_NAME", "CSEC464")`

### Redis Vars

* `REDIS_PASSWORD`

### Redis UI Vars

* `REDIS_HOST`
* `REDIS_PORT`
* `REDIS_PASSWORD`

## TODO

### Server

* Add Flask-Login/Flask-Security Login functionality
* Pipe Client Data to Redis DB
* Work with Data

### Client

* Create Scripts for sending data back in JSON format
