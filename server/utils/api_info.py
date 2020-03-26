# API INFO 
routes = {
    "routes": 
        [
            {"path": "/api/recv", "methods": "POST", "function": "recieve forensics data from collection source"}, 
            {"path": "/api/test-redis", "methods": "GET", "function": "Test Redis Connection"}
        ]
    }

test_routes = {
    "/api/recv": {
        "methods": "POST",
        "function": "Recieve forensics data from collection source"
    },
    "/api/test-redis" : {
        "methods": "GET",
        "functions": "Test Redis connection"
    }
}