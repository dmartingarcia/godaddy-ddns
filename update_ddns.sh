#!/bin/bash
mydomain="${1}"
myhostname="${2}"

gdapikey="${GDAPIKEY}"

myip=`curl -s "https://api.ipify.org"`
dnsdata=`curl -s -X GET -H "Authorization: sso-key ${gdapikey}" "https://api.godaddy.com/v1/domains/${mydomain}/records/A/${myhostname}"`
gdip=`echo $dnsdata | cut -d ',' -f 1 | tr -d '"' | cut -d ":" -f 2`
echo $dns_data
echo "`date '+%Y-%m-%d %H:%M:%S'` - $mydomain - Current External IP is $myip, GoDaddy DNS IP is $gdip"

if [ "$gdip" != "$myip" -a "$myip" != "" ]; then
  echo "IP has changed!! Updating on GoDaddy"
  curl -s -X PUT "https://api.godaddy.com/v1/domains/${mydomain}/records/A/${myhostname}" -H "Authorization: sso-key ${gdapikey}" -H "Content-Type: application/json" -d "[{\"data\": \"${myip}\"}]"
  curl -v -X PUT "https://api.godaddy.com/v1/domains/${mydomain}/records/CNAME/*.${myhostname}" -H "Authorization: sso-key ${gdapikey}" -H "Content-Type: application/json" -d "[{\"data\": \"${myhostname}.${mydomain}.\"}]"
  echo "Changed IP on ${myhostname}.${mydomain} from ${gdip} to ${myip}"
fi
