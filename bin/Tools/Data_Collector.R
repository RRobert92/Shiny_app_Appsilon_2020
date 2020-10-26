################################################################################
# Tool: Data collector
#
# This tool collect information selected by the user, and filter ship_data
#
# Filtering is based on the costumer specification:
# - find LAT and LON when the ship traveled longest between 
#   the two consecutive observations
# - find LAT and LON when the ship traveled the same distance at the same time
#   between two consecutive observations
#
# x for the function related to the list of selected ship_type
# y for the function related to the list of selected ship_name or names
#
# (c) 2020 Kiewisz
# This code is licensed under GPL V3.0 license (see LICENSE.txt for details)
#
# Author: Robert Kiewisz
# Created: 2020-10-24
################################################################################

Filter_by_ID <- function(x, y){
  
  # Retrieve correct data based Ship_type and filter it for ship_names
  Collected_points <- tibble()
  Ship_Data_df <<- read_rds(paste("Data/", x, ".rds", sep = ""))
  Ship_Data_df <<-  Ship_Data_df %>% filter(SHIPNAME %in% y)
  Ship_Data_df <- Ship_Data_df[order(Ship_Data_df$DATETIME), ]
    
    j = 1
    Ship_Data_output <- tibble()
    df_df <-tibble()
    
    # Calculate segment distances and time
    while (j <= nrow(Ship_Data_df)) {
      df_df <- as.matrix(Ship_Data_df[j:as.numeric(j+1), 1:2])
      
      tryCatch({
             Ship_Data_output[j, 1] <- round(as.numeric(geo_point_dist(df_df)), 
                                            3)
      },
      warning = function(w){}
      )
      if(is.na(Ship_Data_output[j, 1])){
        
        Ship_Data_output[j, 1] <- 0
      }
      
      Ship_Data_output[j, 2] <- round(as.numeric(Ship_Data_df[as.numeric(j+1), "DATETIME"] - Ship_Data_df[j, "DATETIME"]), 
                                     2)
      Ship_Data_output[j, 3] <- j
      
      j = j + 1
    }
    
    # Find longest traveled distance
    df_df <- tibble()
    longest <- tibble(Ship_Data_df[which.max(Ship_Data_output$...1):as.numeric(which.max(Ship_Data_output$...1)+1), ],
                      ICON = "longest")
    
    # Find when the ship traveled with the same speed over the same travel time
    j = 1
    while (j < nrow(Ship_Data_output)) {
      if(any(is.na(Ship_Data_output[j:as.numeric(j+1), 1:2]) == TRUE)){
        
        df_df[j, 1:3] <- as.numeric(NA)
      } else{
             if(Ship_Data_output[j,1] == Ship_Data_output[as.numeric(j+1), 1] &&
                Ship_Data_output[j,2] == Ship_Data_output[as.numeric(j+1), 2]){
        df_df[j, 1:3] <- Ship_Data_output[j, 1:3]
      } else {
        df_df[j, 1:3] <- as.numeric(NA)
      } 
      }

      
      j = j + 1
    }
    df_df <- na.omit(df_df)
    
    # Collect data of the travel with the same speed and the same time for only 
    # most recent one.
    df_same_travel <- tibble()
    if(nrow(df_df) > 0){
      #for (j in 1:nrow(df_df)) {
      #  df_bin <- rbind(df_bin,
      #                  Ship_Data_df[as.numeric(df_df[j, 3]):as.numeric(df_df[j,3]+1), ])
      #}
      df_same_travel <- tibble(Ship_Data_df[as.numeric(nrow(df_df)-1):nrow(df_df), ],
                               ICON = "SAMETRLV")
    } 
    Collected_points <- rbind(longest,
                              df_same_travel)

  assign("Ship_statistic",
         tibble(DIST = sum(na.omit(Ship_Data_output$...1)),
                TIME = sum(na.omit(Ship_Data_output$...2))),
         envir = .GlobalEnv)
  
  Collected_points
}
