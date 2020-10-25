################################################################################
# Module Read data & data preparation for appshiny.io
#
# (c) 2020 Kiewisz
# This code is licensed under GPL V3.0 license (see LICENSE.txt for details)
#
# Author: Robert Kiewisz
# Created: 2020-10-25
################################################################################

# Load list of ship types and ship names and time it for appshiny.io

#Ships_Data <- read_csv("Data/ships.csv")
#Ships_Data <- tibble(Ships_Data[1],
#                     Ships_Data[2],
#                     Ships_Data[3],
#                     Ships_Data[7],
#                     Ships_Data[8],
#                     Ships_Data[11],
#                     Ships_Data[12],
#                     Ships_Data[13],
#                     Ships_Data[20],
#                     Ships_Data[21],
#                     Ships_Data[24])
#
#Ship_list <- tibble(Ships_Data[20],
#                    Ships_Data[24])
#write_rds(Ship_list, "Data/Ship_list.rds")
#
#for(i in unique(Ship_list$ship_type)){
#  assign(i,
#         Ships_Data %>% filter(ship_type == i))
# write_rds(get(i),
#           paste("Data/", i, ".rds", sep = "")) 
#}

Ship_list <<- read_rds("Data/Ship_list.rds")
