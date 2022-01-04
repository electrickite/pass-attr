#!/usr/bin/env bash
# pass-attr extension - line command
# Usage: pass line <line number> <password name>
#
# Copyright 2022 Corey Hinshaw
# License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.

local clip=0 qr=0 line path pass

if [[ $# -gt 0 && ("$1" == "-c" || "$1" == "--clip") ]]; then
    clip=1
    shift
elif [[ $# -gt 0 && ("$1" == "-q" || "$1" == "--qrcode") ]]; then
    qr=1
    shift
fi

if [[ $# -lt 1 ]]; then
    die "Error: password name not specified"
elif [[ $# -lt 2  ]]; then
    line=1
    path="$1"
else
    line="$1"
    path="$2"
fi

if ! [[ "$line" =~ ^[0-9]+$ ]]; then
    die "Error: line number must be an integer"
fi

pass=$(cmd_show "$path" | tail -n "+${line}" | head -n 1)

if [[ $clip -eq 1 ]]; then
    clip "$pass" "${path} line ${line}"
elif [[ $qr -eq 1 ]]; then
    qrcode "$pass" "${path} line ${line}"
else
    echo "$pass"
fi
