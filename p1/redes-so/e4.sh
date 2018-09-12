#/bin/bash

while read host; do
    printf "GET / HTTP/1.0\r\nHost: $host\r\n\r\n" | nc "$host" 80 |\
        grep -i '^content-length:' | cut -d: -f2 | tr -d ' '
done
