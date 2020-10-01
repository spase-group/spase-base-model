#!/bin/bash
# Build all files for all versions of the informaiton model.

prefix=${1:-spase-base}
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -e 1.1.0 -r 2006-08-31 -o model/${prefix}-1.1.0.json spase-base-1.1.0
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -e 1.2.0 -r 2007-05-22 -o model/${prefix}-1.2.0.json spase-base-1.2.0
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -e 1.2.1 -r 2008-03-20 -o model/${prefix}-1.2.1.json spase-base-1.2.1
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -e 1.2.2 -r 2008-08-14 -o model/${prefix}-1.2.2.json spase-base-1.2.2
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -e 1.3.0 -r 2008-11-22 -o model/${prefix}-1.3.0.json spase-base-1.3.0
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -e 2.0.0 -r 2009-04-15 -o model/${prefix}-2.0.0.json spase-base-2.0.0
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -e 2.1.0 -r 2010-03-19 -o model/${prefix}-2.1.0.json spase-base-2.1.0
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -e 2.2.0 -r 2011-01-06 -o model/${prefix}-2.2.0.json spase-base-2.2.0
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -e 2.2.1 -r 2011-08-18 -o model/${prefix}-2.2.1.json spase-base-2.2.1
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -e 2.2.2 -r 2012-02-27 -o model/${prefix}-2.2.2.json spase-base-2.2.2
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -e 2.2.4 -r 2015-05-31 -o model/${prefix}-2.2.4.json spase-base-2.2.4
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -e 2.2.6 -r 2015-09-09 -o model/${prefix}-2.2.6.json spase-base-2.2.6
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -e 2.2.8 -r 2016-07-21 -o model/${prefix}-2.2.8.json spase-base-2.2.8
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -e 2.2.9 -r 2017-11-14 -o model/${prefix}-2.2.9.json spase-base-2.2.9
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -e 2.3.0 -r 2018-05-31 -o model/${prefix}-2.3.0.json spase-base-2.3.0
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -e 2.3.1 -r 2019-11-14 -o model/${prefix}-2.3.1.json spase-base-2.3.1
node ../../spase-model-tools-node/src/makejson.js -c ../overview.json -e 2.3.2 -r 2020-09-24 -o model/${prefix}-2.3.2.json spase-base-2.3.2