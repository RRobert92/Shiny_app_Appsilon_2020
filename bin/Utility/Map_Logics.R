################################################################################
# Module: Map logic
#
# (c) 2020 Kiewisz
# This code is licensed under GPL V3.0 license (see LICENSE.txt for details)
#
# Author: Robert Kiewisz
# Created: 2020-10-24
################################################################################

Map_server <- function(input, output, session){
  observeEvent(input$`Update_value`, {
    # for debugging
    Ship_types <<- input[["ship_type_dropdown"]]
    Ship_IDs <<- input[["ship_name_dropdown"]]
    Ship_data_selected <<- Filter_by_ID(Ship_types, Ship_IDs)
    
    output$ship_map <- renderLeaflet({
      leaflet() %>% 
        addProviderTiles(providers$Stamen.TonerLite,
                         options = providerTileOptions(noWrap = TRUE)) %>% 
        addMarkers(data = Ship_data_selected[1:2])
    })
  })
}