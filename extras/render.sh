#!/bin/bash -e

rm -rf /var/lib/mod_tile/default/*

/etc/init.d/renderd restart

render_list -n 2 -m kaufmich -a -f -z 0 -Z 6

# render_list -n 2 -m kaufmich -a -f -z 7 -Z 7 --min-x=66 --max-x=68 --min-y=44 --max-y=45
# etc ...

/etc/init.d/renderd restart
