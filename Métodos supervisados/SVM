#Método supervisado SVM
#Cargar los paquetes
library(e1071)   # Para SVM
library(caret)   # Para métricas y partición de datos
library(dplyr)   # Para manipulación de datos

##Entrenar el modelo SVM clasificación##

# Convertir la variable objetivo en factor (si no lo está)
train_data$Class <- as.factor(train_data$Class)
test_data$Class <- as.factor(test_data$Class)

# Entrenar el modelo SVM
svm_model <- svm(Class ~ ., data = train_data, kernel = "linear", scale = TRUE)

# Ver un resumen del modelo
summary(svm_model)

##Realizar predicciones##

# Predicción en el conjunto de prueba
predictions <- predict(svm_model, test_data)

# Crear matriz de confusión
library(caret)
confusion_mat <- confusionMatrix(predictions, test_data$Class)

# Mostrar matriz de confusión
print(confusion_mat)

# Extraer métricas clave
accuracy <- confusion_mat$overall["Accuracy"]      # Precisión
precision <- confusion_mat$byClass["Precision"]    # Precisión por clase
recall <- confusion_mat$byClass["Recall"]          # Sensibilidad
specificity <- confusion_mat$byClass["Specificity"]  # Especificidad
f1_score <- 2 * (precision * recall) / (precision + recall)  # Score F1

# Mostrar métricas
cat("Precisión (Accuracy): ", accuracy, "\n")
cat("Precisión (Precision): ", precision, "\n")
cat("Sensibilidad (Recall): ", recall, "\n")
cat("Especificidad: ", specificity, "\n")
cat("Score F1: ", f1_score, "\n")

## Visualizar la separación de clases##

# Graficar con ggplot2
library(ggplot2)
train_data$Prediction <- predict(svm_model, train_data)

ggplot(train_data, aes(x = train_data[, 2], y = train_data[, 3], color = Prediction)) +
  geom_point(size = 2) +
  labs(title = "Separación de Clases por SVM", x = "Variable 1", y = "Variable 2") +
  theme_minimal()

## Guardar los resultados ##

# Guardar el modelo SVM
saveRDS(svm_model, "svm_classification_model.rds")

# Guardar la matriz de confusión
write.csv(as.table(confusion_mat), "confusion_matrix.csv", row.names = TRUE)
