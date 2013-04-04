#!/bin/sh
#
# NAME
#    test.sh - Test script
#
# BUGS
#    https://github.com/l0b0/xspf2csv/issues
#
# COPYRIGHT AND LICENSE
#    Copyright (C) 2013 Victor Engmark
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
################################################################################

directory="$(dirname -- "$0")"

test_exit_code() {
    assertEquals \
        "Example" \
        0 \
        "$(xsltproc "${directory}/xspf2csv.xsl" "${directory}/example.xml" > /dev/null; printf $?)"
}

test_example() {
    assertEquals \
        "Example" \
        "$(cat "${directory}/example.csv"; printf x)" \
        "$(xsltproc "${directory}/xspf2csv.xsl" "${directory}/example.xml"; printf x)"
}

# load and run shUnit2
test -n "${ZSH_VERSION:-}" && SHUNIT_PARENT=$0
. /usr/share/shunit2/shunit2
