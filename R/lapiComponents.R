lapiBreadCrumbs <- function(crumbs){
  options = lapply(crumbs, function(el)tags$li(el))
  tags$div(
      tags$ol(class="breadcrumb lapi-crumb", style="padding:0px 0px; margin-bottom:0px;", tagList(
        options
      ))
  )
}

lapiCardsBack <- function(id, title, ...){
  tagList(
    tags$button("data-toggle"="collapse", href=paste0("#",id), title, icon(name="caret-down")),
    tags$div(class="col-xs-12 collapse lapi-card lapi-green", id=id, ...)
  )
}

lapiPanelGroup <- function(id){}


lapiCollapsablePanel <- function(id, title, ..., class=NULL, active = F){
  
    caret <- paste('lapi-caret', ifelse(active,'fa fa-chevron-up', 'fa fa-chevron-down'))
    cl <- paste("panel lapi-menu-panel", class)
    cTag <- tags$div(class=cl, 
                     tags$div(class="panel-heading lapi-colap-panel-heading", role="button", "data-toggle"="collapse", href=paste0("#", id), 
                              tags$span(class="panel-title", title),
                              tags$span(tags$i( class = caret))
                     ),
                     tags$div(id=id, class=paste("panel-collapse collapse lapi-colap-toggle", ifelse(active, 'in', '')), 
                              tags$div(class="panel-body", ...)
                     )
    )
    tagList(cTag, singleton(tags$script(src='www/js/lapicomponents.js')))
}