################################################################################
# Shiny Server
#
# (c) 2020 Kiewisz
# This code is licensed under GPL V3.0 license (see LICENSE.txt for details)
#
# Author: Robert Kiewisz
# Created: 2020-10-24
################################################################################

# Shiny Server  ----------------------------------------------------------------
function(input, output, session) {
  
  callModule(Buttons_server, "Home")
  callModule(Map_server, "Home")
}
