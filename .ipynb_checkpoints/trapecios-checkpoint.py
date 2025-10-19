# una función para implementar la regla del trapecio y calcular el valor de una integral

def integrand(x):
    return 1/(x+1)

def trapezoidal(x_min,x_max,n,integrand):

    h = (x_max-x_min)/n
  
    int_int = 0 # la parte "interna" de la integral inicia en cero
    for k in range(1,n):
        int_int = int_int + integrand(x_min + (k*h))
    
    result = (h/2)*( integrand(x_min) + 2*int_int + integrand(x_max) )

    print(result)