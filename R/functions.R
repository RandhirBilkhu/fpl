selectPicker <- function(id, x){
  shinyWidgets::pickerInput(
    inputId = id,
    label = "Player Name", 
    choices = attr(x, "Labels"),
    options = list(
      `live-search` = TRUE)
)
  
}