################################################################################
# Shiny UI-Home
#
# (c) 2020 Kiewisz
# This code is licensed under GPL V3.0 license (see LICENSE.txt for details)
#
# Author: Robert Kiewisz
# Created: 2020-10-24
################################################################################

# Shiny UI-Home  ---------------------------------------------------------------

semanticPage(
  title = App_title,

  Buttons_UI("Home"),
  p(),
  button("Home-Update_value",
         "Refresh"),
  p(),
  leafletOutput("Home-ship_map")
  
)