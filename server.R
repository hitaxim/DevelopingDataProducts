#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
shinyServer(
    function(input, output){
        output$rentalExpenses <- renderText({ calculaterentalExpenses(input$monthlyRent, input$price) })
        output$cashflowPerYear <- renderText({calculateYearlyCashflow(input$monthlyRent, input$waterPerQuarter, input$managementFees, input$monthlyRepayments)})
        output$cashflowPerMonth <- renderText({calculateMOnthlyCashflow(input$monthlyRent, input$waterPerQuarter, input$managementFees, input$monthlyRepayments)})
    }
)

calculaterentalExpenses <- function (monthlyRent, propertyPrice) 
{
    result <- monthlyRent * 12 / propertyPrice * 100
    return(round(result, digits = 2))
}

calculateYearlyCashflow <- function(monthlyRent, water, managementFees, monthlyRepayments)
{
    result <- monthlyRent * 12 - (water) * 4 - managementFees * 12 - monthlyRepayments * 12
    return(round(result, digits = 2))
}

calculateMonthlyCashflow <- function(monthlyRent, water, managementFees, monthlyRepayments)
{
    result <- (monthlyRent * 12 - (water) * 4 - managementFees * 12 - monthlyRepayments * 12) / 12
    return(round(result, digits = 2))
}
