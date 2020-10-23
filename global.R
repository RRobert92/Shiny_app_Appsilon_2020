################################################################################
# Shiny Global
#
# (c) 2020 Kiewisz
# This code is licensed under GPL V3.0 license (see LICENSE.txt for details)
#
# Author: Robert Kiewisz
# Created: 2020-10-24
################################################################################

# Title of the app -------------------------------------------------------------
App_title <- "Shiny_app_Apsilon"

# Global Utility  --------------------------------------------------------------
source("bin/Utility/Library.R")

# Global server settings  ------------------------------------------------------
options(shiny.maxRequestSize = 1024 * 1024^2)
options(shiny.host = "127.0.0.1")
options(shiny.port = 7878)

# Global settings  -------------------------------------------------------------
Ships_Data <- read_csv("Data/ships.csv")

# Global Functions  ------------------------------------------------------------

# Global Packages  -------------------------------------------------------------

# Test Unit --------------------------------------------------------------------