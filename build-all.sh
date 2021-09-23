#!/bin/bash
# Build all files for all versions of the informaiton model.

versions=(${1:-})
suffix=${2:-}
prefix=${3:-spase-base}

draft=()

# Set short name
shortname=""
if [ "$prefix" = "spase-base" ]
then
  shortname="spase"
fi

# If no version specified or a dash (-),  do all
if [ -n "$versions" ] && [ "$versions" = "-" ]
then
versions=""
fi

if [ -z "$versions" ]
then
versions=(1.1.0 1.2.0 1.2.1 1.2.2 1.3.0 2.0.0 2.1.0 2.2.0 2.2.1 2.2.2 2.2.4 2.2.6 2.2.8 2.2.9 2.3.0 2.3.1 2.3.2 2.4.0)
draft=()
fi

# Create "build" folder if it doesn't exist
mkdir -p build

# If suffix specified, add dash to beginning. If a dash (-) do not add suffix
if [ -n "$suffix" ]
then
   if [ "$suffix" = "-" ]
   then
      suffix=""
   else
      suffix="-${suffix}"
   fi
fi

# All release versions or specific one from comment-line
for ver in "${versions[@]}"
do
	echo ${ver}${suffix}
	node ../../spase-model-tools-node/src/makejson.js -b ${prefix}-${ver} -o ../build/${prefix}-${ver}${suffix}.json 
	node ../../spase-model-tools-node/src/makexsd.js -d build/${prefix}-${ver}${suffix}.json -o build/${prefix}-${ver}${suffix}.xsd
	node ../../spase-model-tools-node/src/makepdf.js -b ${prefix}-${ver}/template -d ../../build/${prefix}-${ver}${suffix}.json -o ../../build/${prefix}-${ver}${suffix}.pdf
	if [ -n "$shortname" ]	
	then
	   cp build/${prefix}-${ver}${suffix}.json build/${shortname}-${ver}${suffix}.json
	   cp build/${prefix}-${ver}${suffix}.xsd build/${shortname}-${ver}${suffix}.xsd
	   cp build/${prefix}-${ver}${suffix}.pdf build/${shortname}-${ver}${suffix}.pdf
	   
	   cp build/${prefix}-${ver}${suffix}.xsd build/${shortname}-${ver//\./_}${suffix}.xsd
	fi
done

# All draft versions
suffix="-draft"
for ver in "${draft[@]}"
do
	echo ${ver}${suffix}
	node ../../spase-model-tools-node/src/makejson.js -b ${prefix}-${ver} -o ../build/${prefix}-${ver}${suffix}.json 
	node ../../spase-model-tools-node/src/makexsd.js -d build/${prefix}-${ver}${suffix}.json -o build/${prefix}-${ver}${suffix}.xsd
	node ../../spase-model-tools-node/src/makepdf.js -b ${prefix}-${ver}/template -d ../../build/${prefix}-${ver}${suffix}.json -o ../../build/${prefix}-${ver}${suffix}.pdf
	if [ -n "$shortname" ]	
	then
	   cp build/${prefix}-${ver}${suffix}.json build/${shortname}-${ver}${suffix}.json
	   cp build/${prefix}-${ver}${suffix}.xsd build/${shortname}-${ver}${suffix}.xsd
	   cp build/${prefix}-${ver}${suffix}.pdf build/${shortname}-${ver}${suffix}.pdf
	   
	   cp build/${prefix}-${ver}${suffix}.xsd build/${shortname}-${ver//\./_}${suffix}.xsd
	fi
done

