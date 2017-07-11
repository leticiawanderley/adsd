#!/usr/bin/env python
# -*- coding: utf-8 -*-

import random

class Simulacao:

    fila_1 = []
    fila_2 = []
    proxima_chegada_1 = -1
    proxima_chegada_2 = -1
    termino = -1
    momento = 0
    servidor_livre = True
    qtd_eventos = 0

    def __init__(self, qtd_eventos):
        self.qtd_eventos = qtd_eventos
        self.f = open('resultado', 'w')

    def escalona_chegada_fila_1(self):
        self.proxima_chegada_1 = random.randint(1, 10) + self.momento

    def escalona_chegada_fila_2(self):
        self.proxima_chegada_2 = random.randint(1, 5) + self.momento

    def aloca_servidor(self):
        self.servidor_livre = False
        self.termino = random.randint(3, 7) + self.momento

    def print_estado_sistema(self, tipo_evento):
        self.f.write("Tipo de evento: " + tipo_evento +
        ", Momento do evento: " + str(self.momento) +
        "\nElementos na Fila 1: " + str(self.fila_1) +
        "\nElementos na Fila 2: " + str(self.fila_2) + "\nElemento no serviço: " +
        (("Término em " + str(self.termino)) if not self.servidor_livre else "Nenhum"))
        self.f.write("\n\n")
        self.qtd_eventos = self.qtd_eventos - 1

    def run(self):
        self.escalona_chegada_fila_1()
        self.escalona_chegada_fila_2()
        while(self.qtd_eventos > 0):
            self.momento = self.momento + 1
            if self.termino == self.momento:
                if self.fila_1:
                    self.aloca_servidor()
                    self.fila_1.pop()
                elif self.fila_2:
                    self.aloca_servidor()
                    self.fila_2.pop()
                else:
                    self.servidor_livre = True
                self.print_estado_sistema("Saída")

            if self.proxima_chegada_1 == self.momento:
                self.escalona_chegada_fila_1()
                if self.servidor_livre:
                    self.aloca_servidor()
                else:
                    self.fila_1.append('1')
                self.print_estado_sistema("Chegada")
            if self.proxima_chegada_2 == self.momento:
                self.escalona_chegada_fila_2()
                if self.servidor_livre:
                    self.aloca_servidor()
                else:
                    self.fila_2.append('2')
                self.print_estado_sistema("Chegada")

sim = Simulacao(500)
sim.run()
