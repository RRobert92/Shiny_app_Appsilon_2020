################################################################################
# Shiny pre-setting for the buttons
#
# (c) 2020 Kiewisz
# This code is licensed under GPL V3.0 license (see LICENSE.txt for details)
#
# Author: Robert Kiewisz
# Created: 2020-10-24
################################################################################

assign("Ship_type_list",
       unique(Ship_list$ship_type),
       envir = .GlobalEnv)

assign("Ship_name_list",
       unique(Ship_list$SHIPNAME),
       envir = .GlobalEnv)