library(dplyr)
library(caret)
library(stats)
library(Rtsne)

#Reducimos la dimensionalidad mediante el método MDS
#Primero calculamos la matriz de las distancias euclidias
distancias<- dist(df, method = "euclidean")

#Usamos la función mcdscale para realizar el MDS
mdsresults<-cmdscale(distancias, eig = TRUE, k=2)

#Calculamos la varianza explicada
varianza<-mdsresults$eig/sum(mdsresults$eig)*100

#Pasamos a df los datos 
mds.df<-data.frame(mdsresults$points)
colnames(mds.df) <- c("Dim1", "Dim2")

#Graficamos    
mds.df$Class<-clases$Class

library(ggplot2)
ggplot(mds.df, aes(x=Dim1, y=Dim2, color= Class))+
  geom_point(size=2)+
  scale_color_manual(values = c("red", "green", "yellow", "blue", "purple"))+
  labs(title = "MDS", x = "D1", y = "D2")
theme_minimal()

#Realizamos la técnica t-SNE de reducción de dimensionalidad.
library(Rtsne)
#En primer lugar creamos un df sólo con datos numéricos

df.numerico <- df[, sapply(df, is.numeric)]

#Ahora hay que crear una matriz con los datos

matriz<-as.matrix(df.numerico)

#Hay que usar una semilla de aleatorización para que sea reproducible
set.seed(142)

#Añadimos el código
tsne<-Rtsne(X=df.numerico)
tsne_result <- Rtsne(matriz, dims = 2, perplexity = 20, verbose = TRUE, max_iter = 500)

#Creamos un data frame con los resultados anteriores

tsne_df<-as.data.frame(tsne_result$Y)
colnames(tsne_df)<-c("Dim1", "Dim2")
tsne_df$Class<-df$Class

#Graficamos

ggplot(tsne_df, aes(x=Dim1, y=Dim2, colour = Class))+
  geom_point(size=1)+
  scale_color_manual(values = c("red", "green", "yellow", "blue", "purple"))+
  labs(title ="t-SNE", x="Dimensión 1", y="Dimensión 2")+
  theme_minimal()
