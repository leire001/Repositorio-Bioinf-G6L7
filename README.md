# Repositorio-Bioinf-G6L7

# Proyecto de Análisis de un conjunto de datos de origen biológico mediante técnicas de machine learning supervisadas y no supervisadas 

Este repositorio contiene el flujo de trabajo completo para realizar análisis de datos, incluyendo preparación de datos, métodos supervisados, reducción de dimensionalidad y métodos de clusterización. 

## Estructura del repositorio

El repositorio se organiza en las siguientes carpetas:

1. **Preparación de datos**  
   Contiene los scripts necesarios para configurar el entorno de trabajo y generar la base de datos utilizada en los análisis posteriores.  
   - Es necesario establecer el directorio de trabajo en el script principal antes de ejecutar el flujo de trabajo:
     ```R
     # Configurar el directorio de trabajo (modificar según sea necesario)
     setwd("~/ruta/al/repositorio")
     ```
   - Este script también carga las librerías necesarias y procesa los datos iniciales para generar la base de datos de trabajo.

2. **Datos**  
   Contiene los datos iniciales necesarios para ejecutar el flujo de trabajo. Asegúrate de que esta carpeta contenga todos los archivos requeridos antes de ejecutar los scripts.

3. **Métodos supervisados**  
   Contiene el código para ejecutar un modelo de Random Forest y evaluar su desempeño.  
   - Incluye scripts para realizar la clasificación y analizar los resultados del modelo.
    Contiene el código para ejecutar un modelo de SVM y evaluar su desempeño.  
   - Incluye scripts para realizar la clasificación y analizar los resultados del modelo.

4. **Métodos de reducción de dimensionalidad**  
   Contiene los scripts para aplicar técnicas de reducción de dimensionalidad, como PCA (Análisis de Componentes Principales) u otros métodos similares.

5. **Métodos de clusterización**  
   Contiene el código para realizar análisis de clusterización, como K-means, clustering jerárquico, entre otros.

## Requisitos del entorno

- **R versión ≥ 4.0.0**  
- Librerías de R necesarias (se instalan automáticamente en los scripts de preparación de datos):
  - `caret`
  - `randomForest`
  - `dplyr`
  - `e1071`
  - Añadir las necesarias para el resto de métodos

