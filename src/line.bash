#!/usr/bin/env bash
# pass-attr extension - line command
# Usage: pass line <line number> <password name>
#
# Copyright 2021 Corey Hinshaw
# License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.

if [[ "$#" -lt 1 ]]; then
    die "Error: password name not specified"
elif [[ "$#" -lt 2  ]]; then
    line=1
    path="$1"
else
    line="$1"
    path="$2"
fi

if ! [[ "$line" =~ ^[0-9]+$ ]]; then
    die "Error: line number must be an integer"
fi

cmd_show "$path" | tail -n "+${line}" | head -n 1
