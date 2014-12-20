library(shiny)
library(dplyr)
d1<-read.csv("Cars.csv", sep=",", header=FALSE)
colnames(d1)<-c("buyingprice","maintcost","doors","persons","lugboot","safety","car")
# Overall UI
shinyUI(

  # Use fluid bootstrap model
  fluidPage(
  
    # Page Title
    titlePanel("Car Evaluation"),
    p("Documentation for",a("Car Evaluation", href="https://github.com/Explorer123/DataProductsProject/blob/master/documentation.html")),
    p("Documentation for",a("Car Evaluation", href="https://github.com/Explorer123/DataProductsProject/blob/master/documentation.md")),
    h4("Select attributes of car"),
    h4("Select attributes of car"),
    # Side bar panel
      sidebarLayout(
       sidebarPanel(
        # Display car attributes that the user needs to select from
        h5("Cost of Ownership "),
        selectInput('bpr','Buying Price:', choices=sort(levels(d1$buyingprice))),
        selectInput('mac','Maintenance cost:', choices=sort(levels(d1$maintcost))),
        hr(),
        h5("Comfort "),
        checkboxGroupInput('doo','Number of doors:', choices=sort(levels(d1$doors)), selected = 2),
        checkboxGroupInput('per','Capacity/Number of persons:', choices=sort(levels(d1$persons)), selected = 2),
        checkboxGroupInput('lug','Size of luggage boot:', choices=sort(levels(d1$lugboot)), selected = 'small'),
        hr(),
        h5("Safety "),
        selectInput('saf','Estimated Safety of car:', choices=sort(levels(d1$safety))),
        hr(),
        helpText("Plot on the right shows #of cars and their evaluations based on the selections: 
                 Unacceptable(unacc),
                 Acceptable(acc), 
                 Good(good), V
                 ery Good(vgood)")
        
    
      ),
    # Main panel  
    mainPanel(
    # Display selections made by the user
      h5("Your car attribute selections:"),
      helpText("Scroll down to see the bar plot"),
      h6("Buying Price"),verbatimTextOutput("bp"),
      h6("Maintenance Cost"),verbatimTextOutput("mc"),
      h6("# of doors"),verbatimTextOutput("do"),
      h6("Capacity"),verbatimTextOutput("pe"),
      h6("Size of boot"),verbatimTextOutput("lu"),
      h6("Safety"),verbatimTextOutput("sa"),
    # Plot resulting car evaluations based on user selected attributes
      h5("Bar plot below shows number of Cars & their evaluations based on your selections"),
      plotOutput('carplot'),
      hr()
       )
    )
  )
)