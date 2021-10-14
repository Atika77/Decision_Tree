library(ggplot2) # Data visualization
library(rpart)
library(rpart.plot)
head(diamonds)  
View(diamonds)
str(diamonds)
# Split dataset in training and testing  
index <- sample(1:nrow(diamonds), nrow(diamonds) *0.8)
train <- diamonds[index,]
test <- diamonds[-index,]
# We will predict the cut of diamonds using the features available in the  diamonds dataset.  
fit_tree <- rpart(cut~ ., data = train)
fit_tree
#plot the graph
rpart.plot(fit_tree, main="Conditional Inference Tree")
#prediction
test$pred <- predict(fit_tree, newdata = test, type="class")
tbl = table(target = test$pred,test$cut)
tbl
sum(diag(tbl)) / sum(tbl) 
