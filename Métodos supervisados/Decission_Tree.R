
############## Decission Tree ##############


modelLookup(model = "rpart") # Vemos si este método es útil para Regresión y para Clasificación.

set.seed(1995)

dtModel <- train(Class ~.,
                 data = trainData,
                 method = "rpart",
                 trControl = trainControl(method = "cv", number = 10),
                 preProcess = c("center", "scale"),
                 tuneLength = 10)
dtModel

plot(dtModel)

fancyRpartPlot(dtModel$finalModel, type=4)

predictions_dt <- predict(dtModel, newdata = testData, type = "raw")

# Matriz de confusión del modelo Decission Tree

CM_dt <- confusionMatrix(predictions_dt, testData$Class)

# Mostramos la matriz de confusión

print(CM_dt)

# Extraemos las métricas de precisión, sensibilidad, especifidad y F1-score

precision_dt <- CM_dt$overall["Accuracy"] # Precisión del método Decission Tree
print(precision_dt)

sensibilidad_dt <- CM_dt$byClass[, "Sensitivity"] # Sensibilidad
print(sensibilidad_dt)

especificidad_dt <- CM_dt$byClass[,"Specificity"] # Especifidad
print(especificidad_dt)

f1_score_dt <- 2 * (precision_dt * sensibilidad_dt) / (precision_dt + sensibilidad_dt) # F1-score
print(f1_score_dt)

# Mostramos las métricas 

cat("Precisión (Accuracy): ", precision_dt, "\n")
cat("Sensibilidad: ", sensibilidad_dt, "\n")
cat("Especificidad: ", especificidad_dt, "\n")
cat("Score F1: ", f1_score_dt, "\n")

