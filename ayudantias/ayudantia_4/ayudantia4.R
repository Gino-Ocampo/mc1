# AYUDANTÍAS MÉTODOS CUANTITATIVOS 1: ANÁLISIS DE DATOS EN R
# Ayudantía 4: Repaso prueba

#IMPORTANTE:
#Para ejecutar una línea: Ctrl + Enter (Windows) o Cmd + Enter (Mac)

# 1. R project: crear un proyecto ----------------------------------------------

# File → New Project → New Directory → New Project
# Elegir nombre y carpeta
# Permite mantener ordenados scripts, datos y resultados

# 2. Paquetes: instalación y carga ---------------------------------------------

# Instalar (solo una vez)
install.packages("tidyverse")

# Cargar (cada vez que abres R)
library(tidyverse)

# 3. Crear vectores ------------------------------------------------------------

# Cada vector representa una misma unidad de análisis (estudiantes)

nombre <- c("Ana", "Luis", "Camila", "Diego", "Valentina")

edad <- c(19, 22, 21, 23, 20)

horas_estudio <- c(2, 5, 3, 6, 4)

horas_trabajo <- c(4, 0, 2, 5, 0)

nivel_socioeco <- c("Bajo", "Medio", "Bajo", "Medio", "Alto")

# 4. Crear factores ------------------------------------------------------------

nivel_socioeco <- factor(nivel_socioeco,
                         levels = c("Bajo", "Medio", "Alto"),
                         ordered = TRUE)

nivel_socioeco

# 5. Crear bases de datos simples ----------------------------------------------

datos <- data.frame(
  nombre,
  edad,
  horas_estudio,
  horas_trabajo,
  nivel_socioeco)

datos

# 6. Explorar bases de datos ---------------------------------------------------

summary(datos)
names(datos)


