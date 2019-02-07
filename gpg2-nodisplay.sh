#!/bin/bash

# For use with gpg.program from .gitconfig. This will force
# the use of the terminal and not try to pop up a GUI for the
# passphrase.

export DISPLAY=
exec /usr/bin/gpg2 "$@"
