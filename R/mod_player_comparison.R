#' player_comparison UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_player_comparison_ui <- function(id){
  ns <- NS(id)
  tagList(
     selectInput( ns("player_name"), "player", choices=unique(foo$player), selected = "Harry Maguire" ),
     DT::DTOutput(ns("dt"))
     
  )
}
    
#' player_comparison Server Function
#'
#' @noRd 
#' 

mod_player_comparison_server <- function(id){
  moduleServer(id, function(input, output, session){
    df <- reactive ({ foo[player==input$player_name,] })
    output$dt <- DT::renderDataTable (df())
  })
}



    
## To be copied in the UI
# mod_player_comparison_ui("player_comparison_ui_1")
    
## To be copied in the server
# callModule(mod_player_comparison_server, "player_comparison_ui_1")
 
