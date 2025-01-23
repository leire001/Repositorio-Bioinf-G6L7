
###########################################################
#   Método de aprendizaje no supervisado : clustering     #
###########################################################


#### ---- clustering no jerárquico con k-means ---- ####

# Nota: para poder realizar los clusterings se han los datos pero sin los nombres de las clases:

df_scaled <- scale(data2)

# A continuación, aparece el código para la implementación del clustering no jerárquico K-means:

kmeans.result <- kmeans(df_scaled, centers = 2, iter.max = 500, nstart = 25)
fviz_cluster(kmeans.result, df_scaled, xlab = '', ylab = '') +
  ggtitle("Cluster plot, centers = 2", subtitle = "") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, margin = margin(b = -10)))

# Para conocer cuál es el número óptimo de k se realiza la siguiente función:

fviz_nbclust(data2, kmeans, method = "wss") +
  ggtitle("optimal number of clusters", subtitle = "") +
  theme_classic()

#### ----clustering jerárquica: aglomerativa --- ####

# Implementación del clustering aglomerativo:

# Primero hay que calcular la distancia de la matriz:

dist_matrix <- dist(df_scaled)

# Hay que ejecutar el algoritmo de clusterización jerárquica aglomerativa "varianza mínima de Ward":

hclust_model_ward <- hclust(dist_matrix, method = "ward.D")

colors <- rainbow(5)
clust_ward <- fviz_dend(hclust_model_ward, 
                        cex = 0.5,
                        k = 5,
                        palette = colors,
                        main = "Ward",
                        xlab = "Índice de Observaciones",
                        ylab = "Distancia") + 
  theme_classic()

df$cluster_ward <- as.factor(cutree(hclust_model_ward, k = 5))

# Para poder obtener el gráfico con el dendograma se ejecuta la siguiente función:

plot(clust_ward, main = "Ward's Linkage")

