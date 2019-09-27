#Integrantes: Lupi Diego
#             Cario Facundo


from random import uniform
from time import time
import math
#import numpy as np
#Sea interes la tasa efectiva,
#n la cantidad de pasos.


def path(S0, u, d, interes, n):
    caminito = []
    St = S0
    St_min = S0
    p = (1 + interes - d)/(u-d)
    q = 1 - p
    for i in range(n):
        if uniform(0,1) < p:
            St *= u
        else:
            St *= d
            if St < St_min:
                St_min = St
    VT = St - St_min
    return VT

#Uso el metodo de Monte Carlo
#METODO A

def A_prime(S0, u, d, interes, err, n):
    esp = 0
    media = 0
    i = 1 
    VT = camino(S0, u, d, interes, n)
    suma = VT
    mediant = 0
    media = VT
    S = media**2
    while math.sqrt(S/float(i)) > err:
        VT = camino(S0, u, d, interes, n) #Cantidad de caminos
        i += 1
        mediant = media
        media = media + float(1.0/i)*(VT - media)
        S = (1 - 1.0/(i-1))*S + i*(media - mediant)**2
    esp = media
    prima = esp/(1+interes)**n
    return prima

##METODO B


def B_prime(S0, u, d, interes, n):
    #la primera posicion de la tupla(0,0) da el nivel del arbol
    #la segunda posicion el valor, ej: si (1,-1) es Sd, (2,0) es Sud o Sdu
    valores = {(0,0): {"lmin": [S0], "value": S0}}# Es el S0
    queue = [(0, 0)]
    while 0 < len(queue):
        nodo = queue.pop(0)
        if nodo[0] == n:
            break

        n1 = nodo[0] + 1, nodo[1] + 1 #quiere decir q sube

        n2 = nodo[0] + 1, nodo[1] - 1 #baja

        
        if n1 not in valores:
            valores[n1] = {"lmin": [], "value": 0}

        if n2 not in valores:
            valores[n2] = {"lmin": [], "value": 0}

        valores[n1]["value"] = valores[nodo]["value"] * u
        for i in valores[nodo]["lmin"]:
            valores[n1]["lmin"].append(min(i, valores[n1]["value"]))

        if n1 not in queue:
            queue.append(n1)

        valores[n2]["value"] = valores[nodo]["value"] * d
        for i in valores[nodo]["lmin"]:
            valores[n2]["lmin"].append(min(i, valores[n2]["value"]))
        

        if n2 not in queue:
            queue.append(n2)
    # ej valores[30,-30] es Sd^30
    p = (1 + interes - d)/(u-d)
    q = 1 - p
    Vl = 0
    j = 0 ## potencia
    ite = -n  
    while ite <= n : 
        value = valores[n,ite]["value"]
        hoja = 0
        for s_min in valores[n,ite]["lmin"]:
            Vn =  value - s_min
            hoja += (p**j)*q**((n-j))*Vn
        j += 1 
        Vl += hoja
        ite += 2 
    Vl = Vl/(1+interes)**n
    return Vl


def comparacion(S0, u, d, interes, n):
    init_time = time()
    Vl = B_prima(S0, u, d, interes, n)
    time_to_finish = time() - init_time
    print("Prima Metodo B: %s tiempo de ejecucion: %f" % (Vl, time_to_finish))
    init_time = time()
    a_Vl = A_prima(S0, u, d, interes, 1, n)
    time_to_finish = time() - init_time
    print("Prima Metodo A: %s tiempo de ejecucion error < 1: %f " % (a_Vl, time_to_finish))
    init_time = time()
    a_Vl = A_prima(S0, u, d, interes, 0.1, n)
    time_to_finish = time() - init_time
    print("Prima Metodo A: %s tiempo de ejecucion error < 0.1: %f " % (a_Vl, time_to_finish))
    return 0

comparacion(100, 1.1, 0.9, 0.05, 25)

