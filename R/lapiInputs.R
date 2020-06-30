
lapiInput <- function(iTag, class="", label="", caption=NULL, size=NULL){
  div <- tags$div(class="form-group shiny-input-container",
                  tags$label(label, class="control-label lapi-label"),
                  iTag,
                  if (!is.null(caption)) {
                    tag('small', list(caption, class="lapi-help-block"))
                  }
  )
  div
}

lapiNumericInput <- function(inputId, label, value, min = NA, max = NA, step = NA,
                             width = NULL, caption=NULL) {
  
  #value <- restoreInput(id = inputId, default = value)
  
  # build input tag
  inputTag <- tags$input(id = inputId, type = "number", class="form-control lapi-label",
                         value = value)
  if (!is.na(min))
    inputTag$attribs$min = min
  if (!is.na(max))
    inputTag$attribs$max = max
  if (!is.na(step))
    inputTag$attribs$step = step
  
  return(lapiInput(inputTag, label=label, caption=caption))
}

maskedInput <- function(inputId, label, value="", caption=NULL){
  inputTag <- tags$input(id = inputId, type = "text", class="form-control lapi-input-mask",
                         value = value)
  el <- lapiInput(iTag = inputTag, label=label, caption=caption)
  tagList(
    singleton(
      tags$head(
        tags$script(src="www/js/jquery.mask.min.js", type = "text/javascript"),
        tags$script(src="www/js/lapiinputs.js", type = 'text/javascript') 
      )
    ),
    el
    # tags$div(class = "form-group shiny-input-container",
    #           tags$label(class = "control-label lapi-label","for" = inputId, label),
    #           tags$input(id = inputId, class="lapi-input-mask form-control", type = "text")
    #          )
  )
}