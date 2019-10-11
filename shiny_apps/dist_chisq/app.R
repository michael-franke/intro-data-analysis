library(shiny)
library(tibble)
library(ggplot2)
library(hrbrthemes)

theme_set(
  hrbrthemes::theme_ipsum(plot_margin = margin(10, 10, 10, 10)) +
    theme(legend.position = "top")
)

ui <- fluidPage(
  titlePanel("The Chi-Square Distribution"),
  sidebarLayout(
    sidebarPanel(
      numericInput(inputId = "quantile",
                   label = "Select Quantile",
                   min = 0, max = 1,
                   value = .95, step  = .01),
      
      numericInput(inputId = "df",
                   label = "Select Degrees Of Freedom",
                   min = 0, max = 10,
                   value = 3, step  = 1)
    ),
    
    mainPanel(
      plotOutput(outputId = "chisq_plot")
    )
  )
)

server <- function(input, output) {
  output$chisq_plot <- renderPlot({
    q   <- input$quantile
    df  <- input$df
    chi <- qchisq(q, df)
    
    df <- tibble(
      x = seq(0, 20, .01),
      y = dchisq(x, df)
    )
    
    ggplot(df, aes(x, y)) +
      geom_ribbon(data = subset(df, x >= chi),
                  aes(ymin = 0, ymax = y), 
                  fill = "pink", alpha = .8) +
      geom_line(size = 2)
  })
}

shinyApp(ui = ui, server = server)