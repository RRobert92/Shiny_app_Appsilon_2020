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
    Ship_data_selected <<- Filter_by_ID(input[["ship_type_dropdown"]], 
                                        input[["ship_name_dropdown"]])
    
    output$ship_map <- renderLeaflet({
      leaflet(Ship_data_selected) %>% 
        addProviderTiles(providers$Stamen.TonerLite,
                         options = providerTileOptions(noWrap = TRUE),) %>% 
        addMarkers(~LON, ~LAT,
                   label = ~ICON,
                   popup = ~ICON)
    })
    
    output$Avg_speed <- renderText(paste(Ship_statistic[1, 1], "kn", sep = " "))
    output$Full_distance <<- renderText(paste(round(Ship_statistic[1, 2],
                                                    2),
                                              "km", sep = " "))
    output$Long_speed <- renderText(paste(
      round((Ship_data_selected[1, 3] + Ship_data_selected[2, 3])/2,
            2), 
      "kn", sep = " "))
    
    output$Long_time <- renderText(paste(
      round(abs(as.numeric((Ship_data_selected[1, 9] - Ship_data_selected[2, 9]))),
            2), 
      "min", sep = " "))
    
    output$Long_distance <- renderText(paste(paste(
      round(as.numeric(geo_point_dist(as.matrix(Ship_data_selected[1:2, 1:2])) * 1000),
            2),
      "m", sep = " ")))
    
    output$Ship_table <- DT::renderDataTable({Ship_data_selected[c(1,2,4,5,9)]})
  })
}
