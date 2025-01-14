############################################
#### Preparación del entorno de trabajo ####
############################################

setwd("~/ruta/al/repositorio")

#Librerías necesarias

library(dplyr)
library(caret)
library(randomForest)


# Cargamos los encabezados del dataframe desde el archivo column_names.txt

encabezados <- readLines("column_names.txt")

# Cargamos los datos desde el archivo gene_expression.csv

datos <- read.csv("gene_expression.csv", header = FALSE, sep = ";")

# Asignamos los encabezados al dataframe

colnames(datos) <- encabezados

# Guardamos el dataframe con encabezados en un nuevo archivo CSV

write.csv(datos, "datos_combinados.csv", row.names = FALSE)
data <- read.csv("datos_combinados.csv")

# Cargamos las etiquetas de los datos (no tienen encabezados, por lo que se lo añadimos)

encabezado_clases <- c("Sample", "Class")
clases <- read.csv('classes.csv', header = FALSE, sep = ";")
colnames(clases) <- encabezado_clases

#Al observar los datos vemos que algunos genes tienen 0 expresión en todas las muestras, por lo que eliminamos las columnas con valor 0 que no aportan información

sumas <- colSums(data) # sumo los datos por columnas
columnascero <- names(sumas[sumas==0]) # veo cuantas sumas son == 0
data2 <- data[, !names(data) %in% columnascero] # reemplazo el dataset df sin esas columnas

#Incluimos la columna de la clase de cada muestra y escalamos los datos
df <- cbind(clases["Class"],scale(data2))

#Asignamos el ID de cada muestra al nombre de cada fila
rownames(df) <- clases$Sample


