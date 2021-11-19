# godaddy-ddns

This script manages Godaddy DNS entries in order to have a dynamic DNS always synced with your computer's IP.

I suggest to execute it using a *crontab* entry like:

`10 * * * *    /place/where/you/have/update_ddns.sh example.org @ > /tmp/godaddy-log`

`10 * * * *    /place/where/you/have/update_ddns.sh example.org apps @ > /tmp/godaddy-log`

In this second case, it's going to place a subdomain instead of using root domain

You can opt to use environment variables to define the API key or edit that file and put your own key there.

# I want to use environment variables

Define it in your `/etc/environment`, and that all.

# Where should I get my API key?

Here it is: https://developer.godaddy.com/keys
