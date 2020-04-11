#!/usr/bin/python3
# CONFIG VARS
import os

# REDIS ENV VARS
redis_host = os.getenv("REDIS_HOST", "redis")
redis_port = os.getenv("REDIS_PORT", "6379")
redis_pass = os.getenv("REDIS_PASSWORD", "")


# SERVER ENV VARS
company_name = os.getenv("COMPANY_NAME", "CSEC464")