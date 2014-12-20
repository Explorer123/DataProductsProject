library(shiny)
library(dplyr)
d1<-read.csv("Cars.csv", sep=",", header=FALSE)
colnames(d1)<-c("buyingprice","maintcost","doors","persons","lugboot","safety","car")

# Define Server
shinyServer(
  function(input,output){
   # Define output variables to display in main panel the user selections 
    output$bp<-renderPrint({input$bpr})  
    output$mc<-renderPrint({input$mac})  
    output$do<-renderPrint({input$doo}) 
    output$pe<-renderPrint({input$per}) 
    output$lu<-renderPrint({input$lug}) 
    output$sa<-renderPrint({input$saf}) 

  # Plot rendered will show car evaluations based on the attribute selections
    output$carplot<-renderPlot({
   
    # Select from dataframe d1 the car evaluations, 
    # after filtering the user selections
    sub<-d1 %>%
        select(car,buyingprice,maintcost,doors,persons,lugboot,safety) %>%
        filter(buyingprice==input$bpr &
                maintcost==input$mac &
                doors %in% input$doo &
                persons %in% input$per& 
                lugboot %in% input$lug & 
                safety==input$saf)
 
    # Aggregate  car evaluations (unacceptable,acceptable, good, vgood)
      agg<-aggregate(sub,by=list(sub$car),FUN=length)
      barplot(agg$car,
              ylab="Number of  cars",
              xlab="Car Evaluaton",
              names.arg=agg$Group.1
              )
    })  
       
  }
  )