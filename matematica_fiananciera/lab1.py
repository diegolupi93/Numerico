#Integrantes: Lupi Diego
#             Cario Facundo


from random import uniform
from time import time
#import numpy as np
#Sea interes la tasa efectiva,
#n la cantidad de pasos.


def camino(S0, u, d, interes, n):
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

#Vl el valor exacto
def A_prima(S0, u, d, interes, Vl, err, n): #N es la cantidad de caminos
    esp = 0
    suma = 0
    i = 0
    while True:
        VT = camino(S0, u, d, interes, n) #Cantidad de caminos
        suma += VT
        i += 1
        aux = suma/i
        if abs(Vl - aux/(1+interes)**n) < err:
            break
    esp = suma/i
    prima = esp/(1+interes)**n
    return prima



#A_prima(100, 1.2, 0.8, 0.05, 25)
##METODO B


def B_prima(S0, u, d, interes, n):
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
    # hojas[i]['lmin'] para obtener la lista de minimos de la hoja i donde 0 es la hoja mas chica y n la mas grande
    # hojas[30]['value'] para obtener el valor de la hoja i donde 0 es la hoja mas chica y n la mas grande
    return Vl


def comparacion(S0, u, d, interes, n):
    init_time = time()
    print("prima Metodo B:")
    Vl = B_prima(S0, u, d, interes, n)
    print(Vl)
    time_to_finish = time() - init_time
    print("tiempo metodo B:")
    print(time_to_finish)
    init_time = time()
    err = 0.1
    a_Vl = A_prima(S0, u, d, interes, Vl, err, n)
    time_to_finish = time() - init_time
    print("tiempo metodo A con error menor a 0.1")
    print(time_to_finish)
    print("prima en Metodo A")
    print(a_Vl)
    err = 0.00001
    init_time = time()
    a_Vl = A_prima(S0, u, d, interes, Vl, err, n)
    print("tiempo metodo A con error menor a 0.00001")
    time_to_finish = time() - init_time
    print(time_to_finish)
    print("prima en Metodo A")
    print(a_Vl)
    return 0

comparacion(100, 1.2, 0.8, 0.05, 25)

