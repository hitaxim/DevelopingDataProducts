#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Cost Estimation"),
    sidebarPanel(
        h4('Property'),
        textInput('text', 'Address', value=''),
        numericInput('price', 'Price (Rs)', 120000),
        numericInput('monthlyRent', 'Monthly Rent (Rs)', 10000),
        h5('Costs'),
        numericInput('monthlyRepayments', 'Monthly Repayments (Rs per month)', 10000),
        numericInput('waterPerQuarter', 'Water (Rs per quarter)', 5000),
        numericInput('managementFees', 'Management Fees (Rs per month)', 1000)
    ),
    mainPanel(
        h4('Rental Yield (%)'),
        textOutput("rentalExpenses"),
        h4('Cashflow Per Month (Rs)'),
        textOutput("cashflowPerMonth"),
        h4('Cashflow Per Year (Rs)'),
        textOutput("cashflowPerYear"),
        br(),
        h4('Instructions'),
        helpText("This application is for buyers to find suitable housings by calculating the expenses beforehand"),
        code("Rental Cost"),
        helpText("Enter the property's price and expected monthly rent to calculate the expected costs."),
        code("Cashflow"),
        helpText("Enter the property's costs to estimate the cashflow running out.")
    )
))