library(shiny)
library(dplyr)
d1<-read.csv("Cars.csv", sep=",", header=FALSE)
colnames(d1)<-c("buyingprice","maintcost","doors","persons","lugboot","safety","car")

# Overall UI
shinyUI(fluidPage(
  navbarPage("Car Evaluation Project", 
      tabPanel("Application",
       h4("Select desired attributes in a car from selections below and view car acceptability in a bar plot at the bottom in the right panel "),
       h6("View Project Documentation in the Documentation tab"),
       sidebarLayout(
       sidebarPanel(
        # Display car attributes that the user needs to select from
        h4("Select attributes of car"),
        hr(),
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
                 Good(good), Very Good(vgood)")

      ),
    # Main panel  
    mainPanel(
    # Display selections made by the user
      h5("Your car attribute selections:"),
      h6("Scroll down to see the bar plot"),
      h6("Buying Price"),verbatimTextOutput("bp"),
      h6("Maintenance Cost"),verbatimTextOutput("mc"),
      h6("# of doors"),verbatimTextOutput("do"),
      h6("Capacity"),verbatimTextOutput("pe"),
      h6("Size of boot"),verbatimTextOutput("lu"),
      h6("Safety"),verbatimTextOutput("sa"),
      
    # Plot resulting car evaluations based on user selected attributes
      h5("Bar plot below shows number of Cars & their evaluations based on your selections"),
      helpText("Note:If no selections for checkbox inputs are made i.e selection is NULL/empty, no filters are applied for that attribute in the data set i.e. all values of that attribute are considered for car evaluation"),  
      plotOutput('carplot'),
      hr()
       )
    )    
),
tabPanel("Documentation",includeHTML("documentation.html")
         )
)
)
)