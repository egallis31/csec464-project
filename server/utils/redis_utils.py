#!/usr/bin/python3
# REDIS UTILS
import redis
import conf

r = redis.Redis(
    host=conf.redis_host,
    port=conf.redis_port, 
    password=conf.redis_pass)

def test_redis():
    return r.ping()