#!/bin/bash

xml_scrapping () {
  wget "https://www.boardgamegeek.com/xmlapi/boardgame/$1?stats=1&comments=1" -O "raw_xml/game_$1.xml" -q
}

make_perc () {
  expr $1 / 3000000
}

for i in {1..300000}
do
  echo -n $i/300000 "and "; make_perc $i;
  xml_scrapping $i
done
