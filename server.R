data("iris")
set.seed(31081990)
library(caret)
inTrain<-createDataPartition(iris$Species,p = 0.75,list = FALSE)
train<-iris[inTrain,]
test<-iris[-inTrain,]
set.seed(3108199)
fit1<-train(Species~., data = iris,method = "rpart")

shinyServer(  
      function(input, output) {
            reac <- eventReactive(input$goButton, {
                  data.frame(Sepal.Length = input$Sepal.Length, 
                                 Sepal.Width = input$Sepal.Width,
                                 Petal.Length = input$Petal.Length,
                                 Petal.Width = input$Petal.Width)

            })
            reac1<- eventReactive(input$goButton, {
                  df<-data.frame(Sepal.Length = input$Sepal.Length, 
                             Sepal.Width = input$Sepal.Width,
                             Petal.Length = input$Petal.Length,
                             Petal.Width = input$Petal.Width)
                  paste("According to the dimensions of sepal and petal, the specie of the flower is"
                        ,"<b>",
                        as.character(predict(fit1,newdata=df)), 
                        "</b>")})
            output$inputValue <- renderDataTable({reac()
                                                  },options = list(searching = FALSE,
                                                                      paging = FALSE,
                                                                      bInfo  = 0) )
            output$prediction<-renderText({reac1()})
            }
)
