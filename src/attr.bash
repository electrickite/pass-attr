#!/usr/bin/env bash
# pass-attr extension - attr command
# Usage: pass attr <attribute> <password name>
#
# Copyright 2021 Corey Hinshaw
# License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.

if [[ "$#" -lt 1 ]]; then
    die "Error: password name not specified"
elif [[ "$#" -lt 2  ]]; then
    attr=""
    path="$1"
else
    attr="$1"
    path="$2"
fi

if [[ -z "$attr" ]]; then
    cmd_show "$path" | tail -n +1 | head -n 1
else
    cmd_show "$path" | grep -m 1 "${attr}:" | sed 's/[^:]*: *//'
fi
