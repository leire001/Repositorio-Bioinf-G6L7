################################################
#### División del set para el entrenamiento ####
################################################

#Vamos a clasificar por tipo de tumor (AGH, CFB, CGC, CHC y HPB)

table(df$Class)

df$Class <- as.factor(df$Class)

#Vamos a sembrar una semilla y dividir el set para el entrenamiento

set.seed(1998)
trainIndex <- createDataPartition(df$Class, p = 0.8, list = FALSE)
trainData <- df[trainIndex,]
testData <- df[-trainIndex,]
