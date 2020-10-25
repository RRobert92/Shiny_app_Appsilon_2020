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

shinyUI(
  semanticPage(
    title = App_title,

    sidebar("Home"),
    Cards_data()
  )
)
