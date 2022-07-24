#!/bin/zsh
# curl -v https://tg.i-c-a.su/json/RegierungBW/2 > page-2.json
# curl -v https://tg.i-c-a.su/json/RegierungBW/3 > page-3.json
# curl -v https://tg.i-c-a.su/json/RegierungBW/4 > page-4.json
# curl -v https://tg.i-c-a.su/json/RegierungBW/5 > page-5.json
# curl -v https://tg.i-c-a.su/json/RegierungBW/6 > page-6.json
# curl -v https://tg.i-c-a.su/json/RegierungBW/7 > page-7.json
# curl -v https://tg.i-c-a.su/json/RegierungBW/8 > page-8.json
# curl -v https://tg.i-c-a.su/json/RegierungBW/9 > page-9.json
# curl -v https://tg.i-c-a.su/json/RegierungBW/10 > page-10.json
# curl -v https://tg.i-c-a.su/json/RegierungBW/11 > page-11.json
# curl -v https://tg.i-c-a.su/json/RegierungBW/12 > page-12.json
# curl -v https://tg.i-c-a.su/json/RegierungBW/13 > page-13.json
# curl -v https://tg.i-c-a.su/json/RegierungBW/14 > page-14.json
# curl -v https://tg.i-c-a.su/json/RegierungBW/15 > page-15.json
# curl -v https://tg.i-c-a.su/json/RegierungBW/16 > page-16.json
# curl -v https://tg.i-c-a.su/json/RegierungBW/17 > page-17.json
# curl -v https://tg.i-c-a.su/json/RegierungBW/18 > page-18.json

for i in {31..90}
do
  curl -v https://tg.i-c-a.su/json/RegierungBW/$i > pagedata/page-$i.json
  sleep 5 # rate limit 15 requests per minute => 5s timeout
done

cat pagedata/page-*.json | grep "Corona-Bericht" > RegierungBW-CoronaBerichte-Export.json