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
source("bin/Utility/Buttons.R")
source("bin/www/index.R")

# Global server settings  ------------------------------------------------------
options(shiny.maxRequestSize = 1024 * 1024^2)
options(shiny.host = "127.0.0.1")
options(shiny.port = 7878)
options(semantic.themes = TRUE)

# Global settings  -------------------------------------------------------------
source("bin/Utility/Read_Data.R")
source("bin/Utility/Button_Settings.R")

# Global Functions  ------------------------------------------------------------
source("bin/Tools/Data_Collector.R")
source("bin/Utility/Map_Logics.R")

# Test Unit --------------------------------------------------------------------