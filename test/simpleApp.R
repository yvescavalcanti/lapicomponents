library("shiny");
# source("R/lapiCurrencyInput.R")

devtools::load_all()

ui <- function(){
fluidPage(tagList(	tags$div(
		lapiCurrencyInput("teste", label="Dinheiro", value = 1000, prefix="R$", caption = "could be Pound Sterling")
	),
	tags$div(
		lapiCurrencyInput("teste_two", label="Cash", value = "",
			decimal.sep=".", big.mark=",", prefix="U$")
	),
	tags$div(
		lapiCurrencyInput(inputId="teste_three", label="Value Three", value = 25.50, caption = "R$")
	)
	

))
}

server <- function(input, output){
	
}


shiny::shinyApp(ui = ui, server = server);
