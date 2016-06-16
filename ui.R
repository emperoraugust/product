shinyUI(pageWithSidebar(  
      headerPanel("Iris Species prediction"),  
      sidebarPanel(    
            sliderInput("Sepal.Length", 'Sepal Length',value = 5.5, min = 2, max = 9, step = 0.01), 
            sliderInput("Sepal.Width","Sepal Width",value = 2.75,min = 1, max = 4.5,step = 0.01),
            sliderInput("Petal.Length","Petal Length",value = 4.5,min = 1, max = 8,step = 0.01),
            sliderInput("Petal.Width","Petal Width",value = 1.5,min = 0.1, max = 3,step = 0.01),
            actionButton("goButton","Submit")
            ),
      mainPanel( 
            h5("The application predicts the specie of a iris flower according to the
               length and width of sepal and petal of the flower, considering the data set 
               iris. To use the application, set the values in the input panel and click to 
               the button submit. After few second the prediction appears in the main panel.
               The used method is the decision tree, that in this case has an accuracy around 91%."),
            h4("Your input is"),
            dataTableOutput("inputValue"),
            h4("Result"),
            htmlOutput("prediction")
      )
))