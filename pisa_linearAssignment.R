train = read.csv("pisa2009train.csv")
test = read.csv("pisa2009test.csv")
tapply(train$readingScore,train$male,mean)
summary(train)
train=na.omit(train)
test=na.omit(test)
train$raceeth=relevel(train$raceeth,"White")
test$raceeth=relevel(test$raceeth,"White")
model=lm(readingScore~. , data=train)
summary(model)
rmse = sqrt(sum(model$residuals^2)/nrow(train))
pred = predict(model, newdata = test)
summary(pred)
sseT = sum((pred - test$readingScore)^2)
rmseT = sqrt(sseT/nrow(test))
mean(train$readingScore)
sseB = sum((mean(train$readingScore) - test$readingScore)^2)
R2T = 1-(sseT/sseB)
