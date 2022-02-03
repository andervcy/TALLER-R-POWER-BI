############################################### 
#--Taller gratuito Ciencia de Datos Ecuador--#
###############################################

# 1. Activación de librerías

library(flattabler) # Manejo de tablas dinámicas
library(magrittr) # Manejo de tablas dinámicas
library(dplyr) # Transformación de datos
library(reshape2)  # Transformación de datos

# 2. Fijación de directorio

setwd("C:/Cursos dictados/Gratuitos/Power BI y R")

# 3. Manejo de tablas dinámicas

data <- read_excel_sheet("2881.xlsx") %>%
  define_labels(n_col = 1, n_row = 2) %>%
  remove_top(6) %>%
  remove_bottom(9) %>%
  fill_labels() %>%
  fill_values() %>%
  unpivot() %>%
  dplyr::transmute(
    Municipios = col1,
    Sexo = row1,
    Periodo = row2,
    Total = as.integer(value)
  )


# 4. De filas a columnas

dat <- data %>% 
  dcast(Municipios+Periodo ~ Sexo)

# 5. Procesamiento 
  
dat <- mutate(dat, PARTICIPACION=(Mujeres/Total)*100)

madrid <- data %>% 
  filter(Municipios=="28 Madrid")



  
