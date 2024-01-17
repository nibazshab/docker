#!/bin/sh

url=http://localhost:6800/jsonrpc
tracker=$(curl -sL https://trackerslist.com/all_aria2.txt)
[ -n $tracker ] && {
  curl -d '{"id":"1","method":"aria2.changeGlobalOption","params":["token:'$key'",{"bt-tracker":"'$tracker'"}]}' $url
  sed -i "s@^\(bt-tracker=\).*@\1$tracker@" /c/aria2.conf
}
