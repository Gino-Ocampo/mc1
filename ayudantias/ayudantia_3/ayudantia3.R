# AYUDANTÍAS MÉTODOS CUANTITATIVOS 1: ANÁLISIS DE DATOS EN R
# Ayudantía 3: R básico: paquetes, variables, objetos, funciones

#IMPORTANTE:
#Para ejecutar una línea: Ctrl + Enter (Windows) o Cmd + Enter (Mac)

# Instalar y cargar Paquetes----------------------------------------------------
# En R, los paquetes son "extensiones" que agregan nuevas funciones
# (por ejemplo: importar datos, limpiar bases, hacer gráficos, etc.)

# IMPORTANTE:
# install.packages() se usa SOLO UNA VEZ (instala en el computador)
# library() se usa CADA VEZ que abrimos R

# 1. PAQUETE: haven 
# Sirve para importar bases de datos de otros programas estadísticos
# (como SPSS, Stata o SAS)
# Muy útil para trabajar con datos reales (ej: encuestas como CASEN)

install.packages("haven")   # instalar
library(haven)              # cargar

# 2. PAQUETE: tidyverse 
# Conjunto de paquetes para manipular, limpiar y analizar datos
# Incluye funciones como: select(), filter(), mutate(), etc.

install.packages("tidyverse")
library(tidyverse)

# 3. PAQUETE: readr 
# Sirve para importar archivos .csv (muy comunes en datos)

install.packages("readr")
library(readr)

# 4. PAQUETE: dplyr 
# Parte de tidyverse, pero se puede usar por separado
# Sirve para manipulación de datos (filtrar, crear variables, resumir)

install.packages("dplyr")
library(dplyr)

# 5. PAQUETE: ggplot2 
# Sirve para hacer gráficos

install.packages("ggplot2")
library(ggplot2)

# Objetos en RStudio------------------------------------------------------------
## Crear Y guardar Objetos.

## Distintos tipos de objetos:

# 1. VECTORES ####
# Estructura: Vector <- c(A, B, C, 1, 2, 3)
# Existen vectores numéricos y de texto

# Ejemplo 1: vector numérico: edades de personas
edades <- c(18, 21, 25, 30)

# Ver el objeto
edades

# Ejemplo 2: vector numérico: ingresos mensuales 
ingresos <- c(500000, 650000, 700000, 1200000)

# Ejemplo 3: vector de texto: nombres de personas ("")
nombres <- c("Ana", "Luis", "Camila", "Pedro")

animales <- c("gato", "perro", "conejo")

# Un vector se crea con la función c(), concatenando los componentes que va a contener
# dicho objeto. Recordemos que son unidimensionales.

# 2. FACTORES #### 
# Estructura: Factor <- factor(objeto/vector, labels = c(etiquetas))

# Sirven para colocar etiquetas a las categorías de un objeto/vector 
# Los factores se usan para representar variables categóricas
# (por ejemplo: nivel educacional, género, territorio, etc.)

# a. Crear un vector numérico llamado nivel_num
# Este vector representa categorías, pero aún SIN significado
nivel_num <- c(1, 2, 3, 2, 1)

# IMPORTANTE:
# Aquí los números NO son cantidades, son CÓDIGOS
# por ejemplo: 1 podría ser básica, 2 media, 3 superior en torno al nivel educativo, 
# o bien podrían ser 1 alta, 2 media, 3 baja en torno a alguna otra variable.
# Aquí nosotros le damos el sentido en torno a la variable y categorías que tengamos

# b. convertir esos códigos en categorías con sentido
# Decidir crear la variable nivel educacional y en torno a esta idea colocar etiquetas
nivel_educ <- factor(nivel_num,
                     levels = c(1, 2, 3),  # qué valores existen
                     labels = c("Básica", "Media", "Superior"))  # qué significan: etiquetas

# variable <- factor(vector,
#                     levels = c(valores del vector),  
#                     labels = c("etiquetas categorías"))  

# Ver el resultado
nivel_educ

## Ahora R entiende que esto es una variable categórica (no numérica 1, 2, 3)

# Desafío:
# ¿Qué creen que pasa si NO usamos factor y dejamos nivel_num tal cual?
nivel_num

# ¿Qué tipo de variable cree R que es?
class(nivel_num)

class(nivel_educ)

## Esto muestra que las variables no son naturales, sino que se construyen a partir de decisiones. 
# Aquí decidimos qué significa cada número.

# 3. BASES DE DATOS ####
# Son estructuras bidimensionales (filas y columnas)

# Ejemplo: crear base de datos simple
datos <- data.frame(
  nombre = c("Ana", "Luis", "Camila", "Pedro"),
  edad = c(18, 21, 25, 30),
  ingreso = c(500, 650, 700, 1200),
  genero = c("F", "M", "F", "M"))

datos

# Ver estructura
str(datos)

# Ver primeras filas
head(datos)

# Acceder a una variable específica con $ (enlaza la variable a la bbdd que la contiene)
datos$edad #variable edad contenida en base datos
datos$ingreso #variable ingreso de la base datos

# Tipos de variables en RStudio-------------------------------------------------
# Existen variables de distintos tipos, y eso se ve reflejado también en R
# Esto es importante porque determina qué operaciones podemos hacer con ellas

# 1. VARIABLES NUMÉRICAS (NUMERIC) ####
# Representan cantidades (edad, ingreso, número de hijos, etc.)

edad <- c(18, 21, 25, 30)

edad

# Ver tipo de variable
class(edad)

# Podemos hacer operaciones matemáticas
mean(edad)   # promedio
max(edad)    # valor máximo


# 2. VARIABLES DE TEXTO (CHARACTER) ####
# Representan nombres o categorías escritas

nombre <- c("Ana", "Luis", "Camila", "Pedro")

nombre

# Ver tipo
class(nombre)

# NO se pueden promediar
# mean(nombre) → esto daría error
mean(nombre)

# 3. VARIABLES CATEGÓRICAS (FACTOR) ####
# Representan categorías con cierto significado social

# Primero creamos una variable simple
genero_texto <- c("F", "M", "F", "F", "M")

# Luego la convertimos en factor
genero <- factor(genero_texto,
                 levels = c("F", "M"),
                 labels = c("Femenino", "Masculino"))

genero

# Ver tipo
class(genero)

# Ver frecuencias
table(genero)

# 4. VARIABLES LÓGICAS (BOOLEANAS) ####
# Solo pueden tomar dos valores: TRUE o FALSE

mayor_edad <- c(TRUE, TRUE, TRUE, TRUE)

mayor_edad

class(mayor_edad)

# También se pueden crear a partir de condiciones
edad > 20

#edad <- c(18, 21, 25, 30)

edad > 24 #¿Qué resultado nos daría?3

# Funciones básicas-------------------------------------------------------------
# Funciones estadísticas simples:

## Longitud: conteo de casos: cuántos casos posee esa variable
length(datos$edad) #$ para acceder a una variable específica

## Promedio, mediana, desviación estándar
mean(datos$edad)
median(datos$edad)
sd(datos$edad) 

## Mínimo y máximo
min(datos$ingreso)
max(datos$ingreso)

## La posición en que se encuentra el dato min y max
which.min(datos$ingreso) # cuál es la posición del dato min
which.max(datos$ingreso) # cuál es la posición del dato max

## Frecuencias
table(datos$genero)
table(datos$edad)

# Funciones de exploración de la bbdd:

## Resumen general de la base de datos
summary(datos)
glimpse(datos)

## Número de filas y columnas de la base de datos
nrow(datos) #filas: casos
ncol(datos) #columnas: variables

## Naturaleza o tipo de la variable
class(datos$edad) 
class(datos$genero)
class(datos)

# Ejemplos prácticos en el análisis de datos -----------------------------------

# 1.Crear datos y guardar objetos 
edades <- sample(x = 22:61, size = 10, replace = TRUE)
ingresos <- sample(x = 120000:650000, size = 10, replace = TRUE)
escolaridad <- sample(x = 0:8, size = 10, replace = TRUE)

# 2.Crear data frame 
desigualdad_poblacion <- data.frame(edades, ingresos, escolaridad)

# 3.Explorar data 
summary(desigualdad_poblacion)
nrow(desigualdad_poblacion) #casos
ncol(desigualdad_poblacion) #variables
names(desigualdad_poblacion)

# 4.Realizamos cálculos básicos 
ingresos
max(ingresos) - min(ingresos)
# Si el resultado es pequeño, los ingresos son similares entre sí
# Si es grande, hay mucha diferencia entre las personas (brecha)

escolaridad
max(escolaridad) - min(escolaridad)

# 5.Calculamos estadísticas básicas 
promedio_ingresos <- mean(ingresos)
promedio_ingresos

promedio_escolaridad <- mean(escolaridad)
promedio_escolaridad

# 6.Observamos situaciones específicas con indexación 
edad_menor_ingreso <- edades[which.min(ingresos)]
edad_menor_ingreso

escolaridad_mayor_ingreso <- escolaridad[which.max(ingresos)]
escolaridad_mayor_ingreso

# Conclusiones R Básico
# Los resultados podrían indicar que la escolaridad puede estar vinculada a desigualdades en los ingresos,
# lo que podría reflejar una distribución desigual de recursos y oportunidades.

# Podemos ver que el R es una herramienta que nos sirve para muchas operaciones, 
# incluso desde las más simples hasta otras más complejas, como veremos más adelante
# Permitiéndonos también realizar análisis sociales y culturales 

