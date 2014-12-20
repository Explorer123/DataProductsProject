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
   
  # If  no selections are made in the checkbox, 
    #all possible values are taken, 
    #i.e. no filtering for that attribute
    ifelse(is.null(input$doo),
        input_do<-levels(d1$doors),input_do<-input$doo)
    
    ifelse(is.null(input$per),
           input_per<-levels(d1$persons),input_per<-input$per)
    
    ifelse(is.null(input$lug),
           input_lug<-levels(d1$lugboot),input_lug<-input$lug)

    
    # Select from dataframe d1 the car evaluations, 
    # after filtering the user selections
    sub<-d1 %>%
        select(car,buyingprice,maintcost,doors,persons,lugboot,safety) %>%
        filter(buyingprice==input$bpr &
                maintcost==input$mac &
                doors %in% input_do &
                persons %in% input_per& 
                lugboot %in% input_lug & 
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