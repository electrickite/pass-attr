# pass attr

An extension for the [pass password manager](https://www.passwordstore.org/)
that shows single lines of a password file, either by attribute name or by line
number.

## pass attr

`pass attr [ [-c, --clip] [--qrcode, -q] ] [attribute] <password name>` shows
only the given attribute from the password file. Multi-line password files
should be stored in the following format:

```
My secret password
URL: www.example.com
Username: myuser
```

The `attr` command will search for a line beginning with the given `attribute`
(case-sensitive) and will output the rest of the line following the `:` with
leading whitespace removed. For exammple, to retrieve the username from the
password file above:

```
$ pass attr username example-password
myuser
```

Omitting the `attribute` will show the first line of the password file,
generally the password itself. The `--clip` and `--qrcode` options copy the
attribute to the clipboard or generate a QR code.

## pass line

`pass line [ [-c, --clip] [--qrcode, -q] ] [line number] <password name>` prints the given line number from the
password file.

Omitting the `line number` will show the first line of the password file,
generally the password itself. The `--clip` and `--qrcode` options copy the
line to the clipboard or generate a QR code.

## Installation

To install system-wide, run `make install` as root. Alternatively, to install
per user:

- Enable `pass` extensions by adding `PASSWORD_STORE_ENABLE_EXTENSIONS=true`
  to the environment
- Add `src/attr.bash` and `src/line.bash` to the user extension directory
  (by default at `~/.password-store/.extensions`)

## Completion

This extensions includes bash completion support. Bash completion is installed
by the Makefile, or source `completion/pass-attr.bash.completion`

## License

Copyright (C) 2022  Corey Hinshaw

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program.  If not, see <http://www.gnu.org/licenses/>.
