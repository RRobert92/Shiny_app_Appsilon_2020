################################################################################
# Shiny UI modules
#
# (c) 2020 Kiewisz
# This code is licensed under GPL V3.0 license (see LICENSE.txt for details)
#
# Author: Robert Kiewisz
# Created: 2020-10-25
################################################################################

sidebar <- function(id) {
  ns <- NS(id)
  div(class="ui sidebar inverted vertical visible menu", 
      style="width: 20rem;",
      div(class="item",
          div(class="active header", "Ship type selection:"),
          div(class="menu",
              a(class="item", 
                dropdown_input(ns("ship_type_dropdown"), 
                               choices = Ship_type_list)),
              a(class="item", 
                dropdown_input(ns("ship_name_dropdown"),
                               choices = Ship_name_list,
                               type = "selection multiple")))),
      div(class="item",
          div(class="active header", 
              button("Home-Update_value",
                     "Refresh")))
)
}

Cards_data <- function(){
  div(class="ui container",
          cards(
            class = "two",
            div(class= "ui raised segment",
            card(style = "width: 500px", 
              div(class="content",
                  div(class="header", "Ship Map"),
                  p(),
                  leafletOutput("Home-ship_map"))
              ),
            )
            )
          )
}