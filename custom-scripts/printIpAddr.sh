#!/bin/bash

echo "current IP adresses are:"
ip addr show | grep inet | awk '{print $2}' | sed -e 's-/.*--' | grep -E '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+'