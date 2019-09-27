from scipy.optimize import curve_fit
import numpy as np
import math
import scipy.stats as st

def func(x, a, b, c): # V_j
	return a + b*x + c*x**2

def encontar_param(func, xdata, ydata):
	arg, pcov = curve_fit(func, xdata, ydata)
	return arg[0], arg[1], arg[2] #arg[0] = a ; arg[1] = b ; arg[2] = c

def generar_N_camino(media, desvio, n, N):
	caminos = []
	for i in range(N):
		caminos.append(np.random.normal(media, desvio, n))
	return caminos

def generar_matriz(S0, r, o, T, n, N, func):
	media = 0
	desvio = math.sqrt(T/n)
	caminos = generar_N_camino(media, desvio, n, N)
	matriz = np.zeros((N, n+1))
	for i in range(N):
		matriz[i][0] = S0
		for j in range(1,n+1):
			z = caminos[i][j-1]
			S_ant = matriz[i][j-1]
			mu_T = (r-(o**2)/2)*(T/n)
			matriz[i][j] = S_ant*np.exp(mu_T + o*z)
	return matriz

def payoff(Sn, k):
	return max(k - Sn, 0)

def matriz_valores_intrisecos(S0, k,  r, o, T, n, N, func):
	matriz = generar_matriz(S0, r, o, T, n, N, func)
	P = np.zeros((N, 2))
	a = 0
	b = 0
	c = 0
	for i in range(N):
		Sn = matriz[i][n]
		P[i][0] = payoff(Sn,k)
		P[i][1] = n
	for j in range(n-1, 0, -1): #desde n-1 hasta 1
		xdata = []
		ydata = []
		for i in range(N):
			Si = matriz[i][j]
			if payoff(Si,k) > 0:
				xdata.append(Si)
				ydata.append(P[i][0]*np.exp(-r)) # son los V_i  
		if xdata != []:
			a, b, c = encontar_param(func, xdata, ydata)
			for t in range(N):
				St = matriz[t][j]
				V = func(St, a, b, c)
				pay = payoff(St,k)
				if V < pay and pay > 0 :
					P[t][0] = payoff(St,k)
					P[t][1] = j
		
	return P

def prima_americana(S0, k,  r, o, T, n, N, func):
	P = matriz_valores_intrisecos(S0, k,  r, o, T, n, N, func)
	prom = 0
	for elem in P:
		prom += elem[0]*np.exp(-r*elem[1]*T/n)
	prom = prom/N
	prima = max(k-S0, prom)
	return prima


prima_put = prima_americana(36, 36, 0.06, 0.2, 1, 50, 20000, func)
print("Prima put americana:")
print(prima_put)

#############################################################
"""
Calculo de una prima de una opción put europea según Black-Scholes
"""

def d1(S0, k, r, o, T):
	ln = np.log(S0/k)
	mu = (r + (o**2)/2)*T
	return (ln + mu)/(o*math.sqrt(T))

def d2(S0, k, r, o, T):
	d1v = d1(S0, k, r, o, T)
	return d1v - o*math.sqrt(T)

def prima_europea(S0, k, r, o, T): 
	d1v = d1(S0, k, r, o, T)
	d2v = d2(S0, k, r, o, T)
	norm1 = st.norm.cdf(-d1v)
	norm2 = st.norm.cdf(-d2v)
	prima = k*np.exp(-r*T)*norm2 - S0*norm1
	return prima

prima_put = prima_europea(36, 36, 0.06, 0.2, 1)
print("\nPrima put Europea:")
print(prima_put)

