lapiChartOutput <- function(outputId, title="", width=500, height=400, classe=""){
  tagList(
    singleton(
      tags$head(
        #tags$link(rel="stylesheet", type="text/css", href="www/css/lapicharts.css"),
        tags$script(src="www/js/bundle.js", type = 'text/javascript'),
        tags$script(src="www/js/lapichart.js", type = 'text/javascript')
      )
    ),
    tags$div(id=outputId, width=width, height=height, class='lapicharts-linechart',
        list(tag('svg', list(
          tag('text', list(x="50%", id="titulo", "text-anchor"="middle", title)),
          tag('g', list(id="gridArea", class="grid", stroke="none", transform="translate(60,320)")),
          tag('g', list(id="gridHorizontal", class="grid", stroke="none", transform="translate(60,40)")),
          tag('g', list(id="plotArea", class="plotArea", fill="#cfe", transform="translate(60,40)")),
          tag('text', list(id="yLabel", "text-anchor"="middle")),
          tag('text', list(id="xLabel", "text-anchor"="middle")),
          tag('g', list(id="leftAxis", transform="translate(60,40)")),
          tag('g', list(id="bottomAxis", transform="translate(60,320)")),
          tag('g', list(id="legenda")),
          tag("defs", list(
              list(tag('filter', list(id="drop-shadow", x=0, y=0, width="200%", height="100%",
                                      tag('feDropShadow', list(stdDeviation="0.2", dx="0.3", dy="0.4"))
                    ))
              )
            ))
        ))  
      )
    )
    # htmlTemplate(paste0(getwd(),"/inst/app/www/basechart.html"), id=outputId, classe='lapicharts-linechart' ,
    #              title="Lapi Line Chart", w=width, h=height)
  )
}


lapiLineChartOutput <- function(outputId, title="", width=600, height=350){
  lapiChartOutput(outputId, title=title, width, height, classe="lapicharts-linechart")
}


lapiGroupHorizontalBarsOutput <- function(outputId, title="", chartsWidth=240, chartsHeight=200){
  tagList(
    singleton(
      tags$head(
        tags$link(rel="stylesheet", type="text/css", href="www/css/lapicharts.css"),
        tags$script(src="www/js/bundle.js", type = 'text/javascript'),
        tags$script(src="www/js/lapichart.js", type = 'text/javascript')
      )
    ),
    tags$div(id=outputId, class='row lapicharts-groupHorizontalBars', chartsWidth=chartsWidth, chartsHeight=chartsHeight)
  )
}

renderLapiLineChart <- function(expr, env=parent.frame(), quoted=FALSE) {
  func <- exprToFunction(expr, env, quoted)
  function(){
    func()
  }
}


renderLapiBarChart <- function(expr, env=parent.frame(), quoted=FALSE) {
  func <- exprToFunction(expr, env, quoted)
  function(){
    func()
  }
}

lapiSparkBarsOutput <- function(id="", height=50, width=200){
  tags$div(id = id, class="lapicharts-sparkbars", height=height, width=width, style="padding:7px; box-sizing:unset;")
}

lapiSparkLinesOutput <- function(id="", height=50, width=200){
  tags$div(id = id, class="lapicharts-sparklines", height=height, width=width, style="padding:0px; box-sizing:unset;")
}

renderLapiSparkBars <- function(expr, env=parent.frame(), quoted=F){
  func <- exprToFunction(expr, env, quoted)
  function(col_one, col_two, bit=1){
    val <- func()
  }
}

lapiGaugeOutput <- function(id="", height=100, width=200){
  tags$div(id = id, class="lapicharts-lapigauge", height=height, width=width, style="padding:0px; box-sizing:border-box;")
}

renderLapiGauge <- function(expr, env=parent.frame(), quoted=F){
  func <- exprToFunction(expr, env, quoted)
  function(col_one, col_two, bit=1){
    val <- func()
  }
}
