################################################################################
# Module: main page button
#
# (c) 2020 Kiewisz
# This code is licensed under GPL V3.0 license (see LICENSE.txt for details)
#
# Author: Robert Kiewisz
# Created: 2020-10-24
################################################################################

Buttons_UI <- function(id) {
  ns <- NS(id)
  column(2,
  dropdown_input(ns("ship_type_dropdown"), 
                 choices = Ship_type_list,
                 type = "selection multiple"),
  
  dropdown_input(ns("ship_name_dropdown"), 
                 choices = Ship_name_list, 
                 type = "selection multiple")
  )
}

Buttons_server <- function(input, output, session) {
  
# Collect info what ship_type was selected
  observeEvent(input[["ship_type_dropdown"]], {
    assign("Ship_Data_type",
           Ship_list %>% filter(ship_type == input[["ship_type_dropdown"]]),
           envir = .GlobalEnv)
    
    update_dropdown_input(session, 
                          "ship_name_dropdown",
                          choices = unique(Ship_Data_type$SHIPNAME))
  })
}

Map_server <- function(input, output, session){
  observeEvent(input$`Update_value`, {
    # for debugging
    Ship_types <<- input[["ship_type_dropdown"]]
    Ship_IDs <<- input[["ship_name_dropdown"]]
    
    output$ship_map <- renderLeaflet({
      leaflet() %>% 
        addProviderTiles(providers$Stamen.TonerLite,
                         options = providerTileOptions(noWrap = TRUE)) %>% 
        addMarkers(data = Filter_by_ID(Ship_types, Ship_IDs))
    })
  })
}