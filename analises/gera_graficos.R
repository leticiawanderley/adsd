library(readr)
library(dplyr)
library(ggplot2)
library(tidyr)

#post2501GB = read_csv("../result/1gbPost250.csv") %>%
#          gather("tipo_tempo", "valor", 2:3)

post2501GB = read_csv("../result/1gbPost250.csv")
post501GB = read_csv("../result/1gbPost50.csv")
put2501GB = read_csv("../result/1gbPut250.csv")
put501GB = read_csv("../result/1gbPut50.csv")

post2501GB$tipo = "Post 250"
post501GB$tipo = "Post 50"
put2501GB$tipo = "Put 250"
put501GB$tipo = "Put 50"


dados1GB = post2501GB %>% select(tempoBanco, tempoHTTP, tipo) %>%
        rbind( post501GB %>% select(tempoBanco, tempoHTTP, tipo) ) %>%
        rbind( put2501GB %>% select(tempoBanco, tempoHTTP, tipo) ) %>%
        rbind( put501GB %>% select(tempoBanco, tempoHTTP, tipo) )

db1GB %>%
  ggplot(aes(x= tipo, y=tempoBanco)) + 
  geom_boxplot() + 
  labs(title = "Tempo de requisição ao banco 1GB RAM", x = "Tipo de requisição", y = "Tempo")

db1GB %>%
  ggplot(aes(x= tipo, y=log(tempoBanco))) + 
  geom_boxplot() + 
  labs(title = "Tempo em log de requisição ao banco 1GB RAM", x = "Tipo de requisição", y = "Tempo em log")

db1GB %>%
  ggplot(aes(x= tipo, y=tempoHTTP)) + 
  geom_boxplot() + 
  labs(title = "Tempo de requisição ao servidor 1GB RAM", x = "Tipo de requisição", y = "Tempo")

db1GB %>%
  ggplot(aes(x= tipo, y=log(tempoHTTP))) + 
  geom_boxplot() + 
  labs(title = "Tempo em log de requisição ao servidor 1GB RAM", x = "Tipo de requisição", y = "Tempo em log")


post250500mb = read_csv("../result/500mbPost250.csv")
post50500mb = read_csv("../result/500mbPost50.csv")
put250500mb = read_csv("../result/500mbPut250.csv")
put50500mb = read_csv("../result/500mbPut50.csv")

post250500mb$tipo = "Post 250"
post50500mb$tipo = "Post 50"
put250500mb$tipo = "Put 250"
put50500mb$tipo = "Put 50"

dados500mb = post250500mb %>% select(tempoBanco, tempoHTTP, tipo) %>%
  rbind( post50500mb %>% select(tempoBanco, tempoHTTP, tipo) ) %>%
  rbind( put250500mb %>% select(tempoBanco, tempoHTTP, tipo) ) %>%
  rbind( put50500mb %>% select(tempoBanco, tempoHTTP, tipo) )

dados500mb %>%
  ggplot(aes(x= tipo, y=tempoBanco)) + 
  geom_boxplot() + 
  labs(title = "Tempo de requisição ao banco 500MB RAM", x = "Tipo de requisição", y = "Tempo")

dados500mb %>%
  ggplot(aes(x= tipo, y=log(tempoBanco))) + 
  geom_boxplot() + 
  labs(title = "Tempo em log de requisição ao banco 500MB RAM", x = "Tipo de requisição", y = "Tempo em log")

dados500mb %>%
  ggplot(aes(x= tipo, y=tempoHTTP)) + 
  geom_boxplot() + 
  labs(title = "Tempo de requisição ao servidor 500MB RAM", x = "Tipo de requisição", y = "Tempo")

dados500mb %>%
  ggplot(aes(x= tipo, y=log(tempoHTTP))) + 
  geom_boxplot() + 
  labs(title = "Tempo em log de requisição ao servidor 500MB RAM", x = "Tipo de requisição", y = "Tempo em log")



post250100mb = read_csv("../result/100mbPost250.csv")
post50100mb = read_csv("../result/100mbPost50.csv")
put250100mb = read_csv("../result/100mbPut250.csv")
put50100mb = read_csv("../result/100mbPut50.csv")

post250100mb$tipo = "Post 250"
post50100mb$tipo = "Post 50"
put250100mb$tipo = "Put 250"
put50100mb$tipo = "Put 50"

dados100mb = post250100mb %>% select(tempoBanco, tempoHTTP, tipo) %>%
  rbind( post50100mb %>% select(tempoBanco, tempoHTTP, tipo) ) %>%
  rbind( put250100mb %>% select(tempoBanco, tempoHTTP, tipo) ) %>%
  rbind( put50100mb %>% select(tempoBanco, tempoHTTP, tipo) )

dados100mb %>%
  ggplot(aes(x= tipo, y=tempoBanco)) + 
  geom_boxplot() + 
  labs(title = "Tempo de requisição ao banco 100MB RAM", x = "Tipo de requisição", y = "Tempo")

dados100mb %>%
  ggplot(aes(x= tipo, y=log(tempoBanco))) + 
  geom_boxplot() + 
  labs(title = "Tempo em log de requisição ao banco 100MB RAM", x = "Tipo de requisição", y = "Tempo em log")

dados100mb %>%
  ggplot(aes(x= tipo, y=tempoHTTP)) + 
  geom_boxplot() + 
  labs(title = "Tempo de requisição ao servidor 100MB RAM", x = "Tipo de requisição", y = "Tempo")

dados100mb %>%
  ggplot(aes(x= tipo, y=log(tempoHTTP))) + 
  geom_boxplot() + 
  labs(title = "Tempo em log de requisição ao servidor 100MB RAM", x = "Tipo de requisição", y = "Tempo em log")
