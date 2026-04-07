# AYUDANTÍAS MÉTODOS CUANTITATIVOS 1: ANÁLISIS DE DATOS EN R
# Ayudantía 2: R básico

#IMPORTANTE:
#Para ejecutar una línea: Ctrl + Enter (Windows) o Cmd + Enter (Mac)

#Calculadora -------------------------------------------------------------------
20+1
22-1
10/2
40*2
5**2 #elevado
5^2 #elevado: potencias 
log(2)
sqrt(21) #raíz cuadrada


# Concatenación de objetos -----------------------------------------------------
#Crear vectores
c(21, 12)

#Operación elemento a elemento
c(21, 12) + c(2, 1)  # 21+2, 12+1

#Multiplicar todos los elementos
6 * c(2, 4, 6)

#Desafío:
#Crea un vector con 3 edades y súmale 1 año a cada una
edades <- c(20, 25, 30)
edades + 1

#Texto
paste("Hola", "mundo")
paste("Edad:", 25)

#Desafío:
#Crear un mensaje tipo: "Tengo 20 años"
paste("Tengo", 20, "años")


# Operadores lógicos -----------------------------------------------------------
#Nos indican si se cumplen ciertas condiciones: TRUE or FALSE
5 == 2 #5 es igual a 2? Falso
5 != 2 #5 es distinto de 2? Verdadero
2 > 4 #Mayor
3 <= 2 # Mayor o igual
3 & 7  # 3 y 7
10 | 2 # 10 o 2

#Las comas separan las operaciones
c(38 <= 15, 3 < 5 & 6, 3 == 5)
#True, True, False

#Desafío:
#¿Qué devuelve esto?
c(10 > 5, 2 == 3, 7 != 8)


# Guardar Objetos --------------------------------------------------------------
p <- 20 # p va a tomar el valor de 20, almacenándose en el Enviroment

#Sobreescribir la variable
a <- 5
b <- a
a <- 4
a
b

presupuesto_2020 <- 20000
presupuesto_2021 <- 30000
presupuesto_total <- presupuesto_2020 + presupuesto_2021
presupuesto_total

# Vectores ---------------------------------------------------------------------
#FUNCIONES BÁSICAS

min #para obtener el mínimo de un vector
max #para obtener el máximo de un vector
length #para obtener la longitud de un vector
range #para obtener el rango de valores de un vector
sum #entrega la suma de todos los elementos de un vector
prod #multiplica todos los elementos de un vector
which.min #entrega la posición del valor min de un vector
which.max #entrega la posición del valor máximo del vector
rev #invierte un vector
str #estructura de la base
nrow #número de filas
ncol #número de columnas

#Crearé un objeto llamado Edades que tenga 17 datos correspondientes a edades 
#desde la 20 a la 45, donde las edades se pueden repetir (True)
Edades <- sample(x = 20:45, size = 17, replace = TRUE)
#Aplicaremos las funciones básicas a este objeto

min(Edades) #dato mínimo
max(Edades) #dato maximo
length(Edades) #conteo de casos, cuántos elementos posee esa variable
class(Edades) #naturaleza o tipo de la variable
unique(Edades) #hace el conteo de casos únicos o categorías (en Variable Nominal)
which.min(Edades) #la posición en la que se encuentra el dato mínimo
which.max(Edades) #la posición en la que se encuentra el dato máximo
mean(Edades) #media o promedio
median(Edades) #mediana
sd(Edades) #desviación estandar

#Desafío:
#¿Cuántas personas tienen más de 30 años?
sum(Edades > 30)


#Indexación --------------------------------------------------------------------
#rescate de elementos de un vector (vector:serie de elementos)
#se extrae algo en particular

Edades[5] #quiero rescatar la edad de la persona número 5
Edades[Edades > 28] #quiero rescatar las edades mayores a 28
Edades[c(2,3,7,9)] #quiero rescatar las edades de las personas que se encuentran 
#en las posiciones 2, 3, 7 y 9 


# Ejemplos prácticos en el análisis de datos 

# 1.Crear datos y guardar objetos ####
edades <- sample(x = 22:61, size = 10, replace = TRUE)
ingresos <- sample(x = 120000:650000, size = 10, replace = TRUE)
escolaridad <- sample(x = 0:8, size = 10, replace = TRUE)

# 2.Crear data frame ####
desigualdad_poblacion <- data.frame(edades, ingresos, escolaridad)

# 3.Explorar data ####
summary(desigualdad_poblacion)
nrow(desigualdad_poblacion)
ncol(desigualdad_poblacion)
names(desigualdad_poblacion)
class(desigualdad_poblacion)
class(edades)
class(ingresos)
class(escolaridad)

# 4.Realizamos cálculos básicos ####
max(ingresos) - min(ingresos)
max(escolaridad) - min(escolaridad)

# 5.Calculamos estadísticas básicas ####
total_edades <- sum(edades)
promedio_ingresos <- mean(ingresos)
mediana_escolaridad <- median(escolaridad)

# 6.Observamos situaciones específicas con indexación ####
edad_menor_ingreso <- edades[which.min(ingresos)]
escolaridad_mayor_ingreso <- escolaridad[which.max(ingresos)]

# Conclusiones R Básico
# Los resultados indican que una baja escolaridad puede estar vinculada a grandes desigualdades en los ingresos,
# reflejando una distribución desigual de recursos y oportunidades.
# También se observa que los ingresos no dependen exclusivamente del nivel educativo.

# Podemos ver que el R es una herramienta que nos sirve para muchas operaciones, 
# incluso desde las más simples hasta otras más complejas, como veremos más adelante
