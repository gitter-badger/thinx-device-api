#!/bin/bash

echo
echo "☢ Running NYC code coverage..."

nyc --reporter=lcov --reporter=text-lcov npm test

echo
echo "☢ Karma..."

karma start

echo
echo "☢ Testing device registration..."

curl -H "Origin: rtm.thinx.cloud" -H "Content-Type: application/json" -H "User-Agent: THiNX-Client" \
-X POST -d '{ "registration" : { "mac" : "00:00:00:00:00:00", "firmware" : "EAV-App-0.4.0-beta:2017/04/08", "hash" : "e58fa9bf7f478442c9d34593f0defc78718c8732", "push" : "registration-token-optional", "alias" : "test", "owner": "admin" } }' \
http://thinx.cloud:7442/device/register

echo
echo "☢ Testing builder..."

curl -H "Origin: rtm.thinx.cloud" -H "User-Agent: THiNX-Client" -H "Content-Type: application/json" -X POST -d '{ "build" : { "mac" : "ANY", "owner" : "test", "git" : "https://github.com/suculent/thinx-firmware-esp8266", "dryrun" : true } }' http://thinx.cloud:7442/api/build

echo
echo "» Testing authentication..."

# Get access cookie by authentication
curl -v -c cookies.jar \
-H "Origin: rtm.thinx.cloud" \
-H "User-Agent: THiNX-Web" \
-H "Content-Type: application/json" \
-X POST -d '{ "username" : "test", "password" : "tset" }' \
http://thinx.cloud:7442/api/login

echo
echo "» Fetching device catalog..."

curl -v -b cookies.jar \
-H "Origin: rtm.thinx.cloud" \
-H "User-Agent: THiNX-Web" \
-H "Content-Type: application/json" \
-X POST -d '{ "query" : false }' http://thinx.cloud:7442/api/view/devices
