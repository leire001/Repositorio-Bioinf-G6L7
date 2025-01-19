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

# Convertir la variable objetivo en factor
train_data$Class <- as.factor(train_data$Class)
test_data$Class <- as.factor(test_data$Class)
