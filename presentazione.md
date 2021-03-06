Course Project: Shiny Application and Reproducible Pitch
========================================================
author: Giacinto Maggiore
date:   June 14, 2016
autosize: true

The Iris Data
========================================================

Iris data set gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris.


```r
data(iris)
table(iris$Species)
```

```

    setosa versicolor  virginica 
        50         50         50 
```

The application
========================================================
These slides are part of a project for the Data Science Specialization on Coursera. The  first part consists in a shiny web app. You can find it in the following urls:
- [Web App Link] (https://emperoraugust.shinyapps.io/product/)
- [Source code] (https://github.com/emperoraugust/product)

The Web App predicts the specie of a iris flower, in according with the dimensions of its Sepal and Petal, inserted by the user. 

Prediction method
========================================================

As prediction method I use a decision tree, after dividing the data set in training set and test set, to measure the accuracy of the model. 

```r
set.seed(31081990)
library(caret)
inTrain<-createDataPartition(iris$Species,p = 0.75,list = FALSE)
train<-iris[inTrain,]
test<-iris[-inTrain,]
fit1<-train(Species~., data = iris,method = "rpart")
```
Decision tree and accuracy
========================================================

The accuracy of the model is 0.9722222
The decision tree is

```r
plot(fit1$finalModel,uniform=TRUE)
text(fit1$finalModel,use.n=TRUE,all=TRUE,cex=.8)
```

<img src="presentazione-figure/unnamed-chunk-3-1.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" style="display: block; margin: auto;" />


