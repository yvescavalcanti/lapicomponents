library("shiny");
# source("R/lapiCurrencyInput.R")

devtools::load_all()

ui <- function(){
fluidPage(tagList(	tags$div(
		lapiCurrencyInput("teste", label="Dinheiro", value = 1000)
	),
	tags$div(
		lapiCurrencyInput("teste_two", label="Cash", value = "",
			decimal.sep=".", big.mark=",", prefix="U$")
	),
	tags$div(
		lapiCurrencyInput(inputId="teste_three", label="Reais", value = 25.50)
	),
	textOutput("soma"),
	tags$div(
		textInput(inputId = "texto",label = "texto",value = "texto")
	),
	textOutput("texto")

))
}

server <- function(input, output){
	output$soma <- renderText({
		paste0("valor=",input$teste_three)
	})
	output$texto <- renderText({
		input$texto
	})
	reactive({
		input$texto
		print(input$teste_three)
	})
}


shiny::shinyApp(ui = ui, server = server);
