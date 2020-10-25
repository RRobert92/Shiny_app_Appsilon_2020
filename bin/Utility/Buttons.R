################################################################################
# Module: main page button
#
# (c) 2020 Kiewisz
# This code is licensed under GPL V3.0 license (see LICENSE.txt for details)
#
# Author: Robert Kiewisz
# Created: 2020-10-24
################################################################################
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