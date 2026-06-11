# AYUDANTÍA N°6: REPASO PRUEBA
# Herramientas tidyverse

# TIDYVERSE  -------------------------------------------------------------------

# Instalar y cargar paquetes 
pacman::p_load(tidyverse, openxlsx, readxl)

# Importar base de datos
library(readxl)
base_antropologia_limpia <- read_excel("base_antropologia_limpia.xlsx")

# Verificar base cargada
ls()
View(base_antropologia_limpia)

# Explorar base
glimpse(base_antropologia_limpia)
summary(base_antropologia_limpia)
names(base_antropologia_limpia)

# Seleccionar variables: SELECT() ####
names(base_antropologia_limpia)

base_antropologia_limpia <- base_antropologia_limpia %>% 
  select(-c(marca, direc, n_encuestador))

seleccionadas <- base_antropologia_limpia %>% 
  select(ea_01_horas_estudio_semana, ea_02_horas_estudio_fin_semana, ea_04_notas_ultimo_semestre)

print(seleccionadas)

# Filtrar casos: comunas sector norte: FILTER() ####
unique(base_antropologia_limpia$comuna)

base_antropologia_limpia %>% 
  filter(comuna %in% c("huechuraba", "quilicura", "lampa", "pudahuel", "conchali", "renca"))

# Mutar categorías con mutate(case_when) ####
unique(base_antropologia_limpia$ea_06_nivel_estres_ultimo_semestre)

base_antropologia_limpia <- base_antropologia_limpia %>%
  mutate(nivel_estres_r = case_when(
    ea_06_nivel_estres_ultimo_semestre == 1 ~ "Muy poco estrés",
    ea_06_nivel_estres_ultimo_semestre == 2 ~ "Poco estrés",
    ea_06_nivel_estres_ultimo_semestre == 3 ~ "Algo de estrés",
    ea_06_nivel_estres_ultimo_semestre == 4 ~ "Suficiente estrés",
    ea_06_nivel_estres_ultimo_semestre == 5 ~ "Mucho estrés"
  ))

unique(base_antropologia_limpia$nivel_estres_r)

# Conclusiones Tidyverse 
# En este ejercicio aplicamos herramientas fundamentales del Tidyverse para importar, explorar,
# seleccionar, filtrar y recodificar datos. Estas herramientas nos ayudan a organizar la información
# y prepararla para análisis más profundos. También reforzamos el criterio al decidir qué variables y casos
# nos interesan, lo que es esencial en cualquier investigación cuantitativa.
