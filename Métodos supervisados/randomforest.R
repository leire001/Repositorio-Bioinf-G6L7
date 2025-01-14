###########################################
#### Método supervisado: Random Forest ####
###########################################

modelLookup(model = "rf")

set.seed(1998)
rfModel <- train(Class ~ .,
                 data = trainData,
                 method = "rf",
                 trControl = trainControl(method = "cv", number = 10),
                 tuneLength = 10,
                 prob.model = TRUE)
rfModel

plot(rfModel)

predictionsrf <- predict(rfModel, newdata = testData, type = "raw")

CMrf <- confusionMatrix(predictionsrf, testData$Class)

# Imprimimos la matriz de confusión
print(CMrf)

# Extraemos las métricas de precisión, sensibilidad, recall y calculamos F1-score para cada clase 

precision <- CMrf$byClass[, "Pos Pred Value"] 
recall <- CMrf$byClass[, "Sensitivity"]      
especificidad <- CMrf$byClass[,"Specificity"]
f1_scores <- 2 * (precision * recall) / (precision + recall)

# Mostramos las métricas de sensibilidad, especificidad, precisión y F1-Score por clase

cat("Precisión:\n")
print(precision)
cat("Recall (sensibilidad):\n")
print(recall)
cat("Especificidad:\n")
print(especificidad)
cat("F1-Score:\n")
print(f1_scores)

