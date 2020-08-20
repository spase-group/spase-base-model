#!/bin/bash
# Build all files for all versions of the informaiton model.

node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -r 1.1.0 -o model/spase-base-1.1.0.json spase-base-1.1.0
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -r 1.2.0 -o model/spase-base-1.2.0.json spase-base-1.2.0
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -r 1.2.1 -o model/spase-base-1.2.1.json spase-base-1.2.1
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -r 1.2.2 -o model/spase-base-1.2.2.json spase-base-1.2.2
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -r 1.3.0 -o model/spase-base-1.3.0.json spase-base-1.3.0
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -r 2.0.0 -o model/spase-base-2.0.0.json spase-base-2.0.0
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -r 2.1.0 -o model/spase-base-2.1.0.json spase-base-2.1.0
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -r 2.2.0 -o model/spase-base-2.2.0.json spase-base-2.2.0
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -r 2.2.1 -o model/spase-base-2.2.1.json spase-base-2.2.1
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -r 2.2.2 -o model/spase-base-2.2.2.json spase-base-2.2.2
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -r 2.2.4 -o model/spase-base-2.2.4.json spase-base-2.2.4
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -r 2.2.6 -o model/spase-base-2.2.6.json spase-base-2.2.6
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -r 2.2.8 -o model/spase-base-2.2.8.json spase-base-2.2.8
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -r 2.2.9 -o model/spase-base-2.2.9.json spase-base-2.2.9
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -r 2.3.0 -o model/spase-base-2.3.0.json spase-base-2.3.0
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -r 2.3.1 -o model/spase-base-2.3.1.json spase-base-2.3.1