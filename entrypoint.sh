#!/bin/bash

/app/build_cert.sh $DERP_HOST $DERP_CERTS /app/san.conf

/app/derper --hostname=$DERP_HOST \
--certmode=manual \
--certdir=$DERP_CERTS \
--stun=$DERP_STUN  \
--a=$DERP_ADDR \
--http-port=$DERP_HTTP_PORT \
--verify-clients=$DERP_VERIFY_CLIENTS
