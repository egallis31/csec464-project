#!/bin/bash

wget --no-check-certificate --quiet \
  --method GET \
  --timeout=0 \
  --header 'Authorization: Basic YWRtaW46cGFzc3dvcmQ=' \
   'http://localhost/api/config/binaries-blobs/EXECUTABLE/linux/installers/grr_3.4.0.8_amd64.deb'
