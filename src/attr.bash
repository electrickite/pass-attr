#!/usr/bin/env bash
# pass-attr extension - attr command
# Usage: pass attr <attribute> <password name>
#
# Copyright 2022 Corey Hinshaw
# License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.

local clip=0 qr=0 attr path pass

if [[ $# -gt 0 && ("$1" == "-c" || "$1" == "--clip") ]]; then
    clip=1
    shift
elif [[ $# -gt 0 && ("$1" == "-q" || "$1" == "--qrcode") ]]; then
    qr=1
    shift
fi

if [[ $# -lt 1 ]]; then
    die "Error: password name not specified"
elif [[ $# -lt 2 ]]; then
    attr=""
    path="$1"
else
    attr="$1"
    path="$2"
fi

if [[ -z "$attr" ]]; then
    pass=$(cmd_show "$path" | head -n 1)
else
    pass=$(cmd_show "$path" | grep -m 1 -- "${attr}:" | sed 's/[^:]*: *//')
fi

if [[ $clip -eq 1 ]]; then
    clip "$pass" "${path}${attr:+ $attr}"
elif [[ $qr -eq 1 ]]; then
    qrcode "$pass" "${path}${attr:+ $attr}"
else
    echo "$pass"
fi
