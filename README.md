# http_share

## Docker container for sharing files in the local network

Based on the official Apache image, with the modification so that the files are listed in a "Fancy" way and UTF-8 encoded.

## Usage
```bash
docker run --rm -p 80:80 -v "$PWD":/usr/local/apache2/htdocs/:ro winter0mute/http_share
```
This will share the content where command is run and can be listed/downloaded from a browser (go to localhost or the IP of the machine).

## Aliasing
For easier use you can make an alias
```bash
alias HTTP_SHARE='docker run --rm -p 80:80 -v "$PWD":/usr/local/apache2/htdocs/:ro winter0mute/http_share'
```

Or you can use this "one-liner" for first printing the IP's of real network interfaces and then starting the container:

```bash
alias HTTP_SHARE='for i in $(find /sys/class/net -type l -not -lname '"'"'*virtual*'"'"' -printf '"'"'%f\n'"'"'); do if [[ $(ip addr show ${i} | head -n1 | grep '"'"' state UP '"'"' | wc -l) -eq 1 ]]; then echo -e "${i}:\n$(ip -4 addr show ${i} | grep -oP '"'"'(?<=inet\s)\d+(\.\d+){3}'"'"')" | column; fi; done; docker run --rm -p 80:80 -v "$PWD":/usr/local/apache2/htdocs/:ro winter0mute/http_share'
```
