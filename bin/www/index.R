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
          ),
          div(class="active header", "Ship name selection:"),
          div(class="menu",
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
  div(class="ui container", style = "margin-top: 50px",
      cards(
        class = "two",
        
        card(style = "width: 570px", 
             div(class="content",
                 div(class="header", "Vesel Map"),
                 p(),
                 leafletOutput("Home-ship_map"))
        ),
        card(style = "width: 500px", 
             div(class="content",
                 div(class="header", "Selected vessel statistic"),
                 message_box(class = "floating", header = "Vessel average speed", ""),
                 textOutput("Home-Avg_speed"),
                 message_box(class = "floating", header = "Vessel traveled distance", ""),
                 textOutput("Home-Full_distance"),
                 p(),
                 h3("Longest travel section"),
                 message_box(class = "floating", header = "Vessel speed", content = ""),
                 textOutput("Home-Long_speed"),
                 message_box(class = "floating", header = "Vessel time", content = ""),
                 textOutput("Home-Long_time"),
                 message_box(class = "floating", header = "Vessel distance", content = ""),
                 textOutput("Home-Long_distance")
             )
        ),
        
        card(style = "width: 1100px", 
             div(class="content",
                 div(class="header", "Selected vesel data points"),
                 DT::dataTableOutput('Home-Ship_table'))
        )
      )
  )
}