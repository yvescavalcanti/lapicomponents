dropNulls <- function(x) {
  x[!vapply(x, is.null, FUN.VALUE = logical(1))]
}

#' Doc for lapiSliderInput
#' @param hide_min_max Boolean. Default = T 
#' @param marks Vector of numeric values that should create marks on the grid
#' @param marks_colors Vector of colors that will be set for each mark background of the marks params.

lapiSliderInput <- function(inputId, label, min, max, value, step=NULL, grt_is_better = T, 
                            marks=NULL, marks_colors=NULL,intervals = NULL, hide_min_max = T){
  if(!is.null(marks_colors)){
    if(length(marks_colors) != length(marks)){
      stop("Se mark_colors for definido, o vetor tem de ter o mesmo comprimento de marks")
    }else{
      marks_colors <- paste0(marks_colors, collapse = ',')
    }
  }
  if(!is.null(marks)){
    marks <- paste0(marks, collapse = ",")
  }
  if(!is.null(intervals)){
    if(length(intervals) > 5){ 
      stop(paste0("lapiSliderInput ", inputId, ": atributo intervals deve conter no máximo 5 valores."))
    }
    intervals <- paste0(intervals, collapse = ",")
  }
  listPropsOne <- dropNulls(list(
    id=inputId, 
    type="number",
    value=value,
    class="lapi-range-slider",
    "data-min"=min,
    "data-max"=max,
    "data-grid"="true", 
    "data-step"=step,
    "data-type"="single",
    label = label,
    "data-grt-is-better" = ifelse(grt_is_better, 1, 0),
    "data-mark" = marks,
    "data-mark-colors" = marks_colors,
    "data-hide-min-max" = ifelse(hide_min_max, "true", NULL),
    setores = intervals
  ))
  listPropsTwo <- dropNulls(list(
    id=paste0("second-input-",inputId), 
    class="lapi-range-second lapi-hidden",
    type="number",
    min=min,
    max=max,
    value=value,
    step=step
  ))
  
  sTag <- tags$div(class="form-group shiny-input-container lapi-slider-input", style="position:relative",
                   singleton(
                     tags$head(
                       tags$script(src='www/js/lapiinput.js', type="text/javascript")
                     )
                   ),
                   tags$div(id=paste0('lapislider-inputdiv-', inputId), class="second-div",
                            tags$label("for"=inputId, class="control-label lapi-label", label),
                            icon(name="edit", class="lapi-icon-pull-right"),
                            do.call(tags$input, listPropsTwo)
                   ),
                   tags$div(id=paste0('lapislider-',inputId),
                            do.call(tags$input, listPropsOne)
                   )
  )
  #)
  dep <- list(
    htmltools::htmlDependency("ionrangeslider", "2.1.6", c(href="shared/ionrangeslider"),
                              script = "js/ion.rangeSlider.min.js",
                              # ion.rangeSlider also needs normalize.css, which is already included in
                              # Bootstrap.
                              stylesheet = c("css/ion.rangeSlider.css",
                                             "css/ion.rangeSlider.skinShiny.css")
    ),
    htmltools::htmlDependency("strftime", "0.9.2", c(href="shared/strftime"),
                              script = "strftime-min.js"
    )
  )
  
  htmltools::attachDependencies(sTag, dep)
}

updateLapiSliderInput <- function(session, inputId, value = NULL, marks = NULL){
  message <- dropNulls(list(value = value, marks = marks))
  session$sendInputMessage(inputId, message)
}
