#!/bin/bash -eu

echo crawl
curl -v -f \
    -H "Content-Type: application/json" \
    -u $RD_OPTION_AUTH_CRAWLER_USER:$RD_OPTION_AUTH_CRAWLER_PASS \
    -d "{\"start_url\":\"https://www.oddspark.com/keiba/RaceList.do?$RD_OPTION_RACE_ID\",\"recache_race\":true}" \
    https://local-horse-racing-crawler.u6k.me/api/crawl

echo close
curl -v -f \
    -H "Content-Type: application/json" \
    -u $RD_OPTION_AUTH_TRADER_USER:$RD_OPTION_AUTH_TRADER_PASS \
    -d "{\"race_id\":\"$RD_OPTION_RACE_ID\"}" \
    https://local-horse-racing-trader.u6k.me/api/vote_close
