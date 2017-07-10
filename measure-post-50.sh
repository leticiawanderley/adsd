#!/bin/bash
for i in {20..90}
do
  for j in {12..25}
  do
    echo $(gdate +%s%N) "POST,B" >> requestlogpost50.txt
    curl -X POST -d '{"status":"Em Preparo", "id_pedido":'$i', "id_item":'$j', "perfil":"Michelly", "quantidade":2.0}' http://olhonaconta.xyz/dev/leticiawanderley/pedido/$i/item/$j >> dblogpost50.txt
    echo $(gdate +%s%N) "POST,A" >> requestlogpost50.txt
    sleep 1s
  done
done
