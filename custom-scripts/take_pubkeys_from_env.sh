#!/bin/bash

function extractPubKey() {
    param=$1
    paramName=$2
    if ! [ -z "$param" ]; then
        echo "found public key in $paramName ..."
        if echo "$param" | base64 -d >> /config/.ssh/authorized_keys; then
            keyIdent=$(echo "$param" | base64 -d | sed -e 's-.*= --')
            echo "  '$keyIdent' successfully added"
        else
            echo "  ... skipped for processing errors"
        fi
    fi
}

extractPubKey "$PUBKEY_01"
extractPubKey "$PUBKEY_02"
extractPubKey "$PUBKEY_03"
extractPubKey "$PUBKEY_04"
extractPubKey "$PUBKEY_05"
extractPubKey "$PUBKEY_06"
extractPubKey "$PUBKEY_07"
extractPubKey "$PUBKEY_08"
extractPubKey "$PUBKEY_09"
extractPubKey "$PUBKEY_10"
