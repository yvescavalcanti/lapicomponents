dropNulls <- function(x) {
  x[!vapply(x, is.null, FUN.VALUE = logical(1))]
}


lapiInput <- function(iTag, class="", label="", caption=NULL, size=NULL){
  div <- shiny::tags$div(class="form-group shiny-input-container",
                 shiny::tags$label(label, class="control-label lapi-label"),
                  iTag,
                  if (!is.null(caption)) {
                    tag('small', list(caption, class="lapi-help-block"))
                  }
  )
  div
}

packDependencies <- function(){
	list(
		 htmltools::htmlDependency("lapicomponents", "0.1.0",
			package = "lapicomponents",
			src = "srcjs",
			script = "currency-bind.js",
			all_files = FALSE
		),
		htmltools::htmlDependency("moneyfield", "0.1.0",
			package = "lapicomponents",
			src = "srcjs",
			script = "/moneyfield.js",
			all_files = FALSE
		)
	)
}


#' Function that generates currency inputs
#' @param inputId
#' @param label
#' @param valua Initial value
#' @param caption
#' @param big.mark default = '.' The thousands separator
#' @param decimal.sep default = ','
#' @param prefix default = NULL
#' @param class default = NULL
#' @return The masked input html
#' @export
lapiCurrencyInput <- function(inputId, label, value = 0, caption=NULL,
							  big.mark = '.', decimal.sep = ',', class=NULL,
							  prefix = NULL){

  listProps <- dropNulls(
				list(
					id = inputId, value = value, 
					caption = caption, "data-thousands" = big.mark,
					"data-decimal" = decimal.sep,
					"data-prefix" = prefix,
					type="text", class=paste(class, "lapi-currency-input") 
				   )
				)
  inputTag <- do.call(tags$input, listProps)

  lapiInput(
		tagList(
			inputTag,
			packDependencies()
		),
		label = label
  )
}
