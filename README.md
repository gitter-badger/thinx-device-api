# ☢ thinx-device-api

[![Twitter: @igraczech](https://img.shields.io/badge/contact-%40igraczech-green.svg?style=flat)](https://twitter.com/igraczech)
[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/suculent/fastlane-plugin-apprepo/blob/master/LICENSE)
[![Build Status](https://img.shields.io/circleci/project/github/suculent/thinx-device-api/master.svg)](https://circleci.com/gh/suculent/thinx-device-api)
[![Coverage Status](https://coveralls.io/repos/github/suculent/thinx-device-api/badge.svg?branch=master)](https://coveralls.io/github/suculent/thinx-device-api?branch=master)

IoT Device Management Server running on node.js.

• Leverages MQTT as an optional side-chain transport layer.

• Serves as an IoT device registration endpoint while storing device data using CouchDB server and Redis session-store.

• Application is a back-end data provider (security agent) for RTM admin console running on the same server (currently on Apache, but should converge to NGINX).

• Provides control to a build server that pushes new firmware versions to client applications (FCM push) and devices (MQTT).

## Future roadmap

* Custom firmware builder for MongooseOS, NodeMCU and Micropython (allow module selection, add THiNX as an OS-level library)

## Supported IoT Platforms

* ESP8266 (thinx-firmware-esp8266)
* Tested on Wemos D1 Mini, Wemos D1 Mini Pro, Robodyn D1, Robodyn D1 Mini and NodeMCU with Arduino, LUA and Micropython-based core firmwares
* Expected: Any Arduino with networking support, MongooseOS

THiNX platform agent repositories:

[Platform.io](https://github.com/suculent/thinx-firmware-esp8266-pio)
[Arduino](https://github.com/suculent/thinx-firmware-esp8266-ino)
[NodeMCU LUA](https://github.com/suculent/thinx-firmware-esp8266-lua)
[Micropython](https://github.com/suculent/thinx-firmware-esp8266-upy)
[MongooseOS](https://github.com/suculent/thinx-firmware-esp8266-mos)

## Prerequisites

* Linux Server (possibly Raspberry Pi but not tested)
* API runs on HTTP port 7442 (possibly HTTPS 7443) and 7447 (websocket)
* MQTT runs on HTTP port 1883 (possibly HTTPS 8883)
* Admin runs on HTTP/HTTPS port (80/443)

## Installation

Ree RTM.md for all details.

### GitHub Webhook support

You can direct your GitHub webhooks to http://thinx.cloud:9000/ after adding a valid deploy key from GitHub to THiNX RTM.

## Endpoints

See 03-test.sh. There is no point of maintaining documentation for this at current stage of development and user base zero.
