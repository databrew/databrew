library(devtools)
library(dplyr)

# Create location history
# https://takeout.google.com/settings/takeout
library(jsonlite)
location_history <- jsonlite::fromJSON(txt = 'LocationHistory.json')$locations
df <- location_history %>%
  mutate(
    longitude = longitudeE7 * 10^-7,
    latitude = latitudeE7 * 10^-7,
    date_precise = as.POSIXct(as.numeric(timestampMs)/1000, origin="1970-01-01", tz="UTC"),
    date_day = as.Date(date_precise)
  ) 

# Save data as "joe" for package inclusion
joe <- df
# Remove list columns and other useless columns
joe <- joe %>%
  dplyr::select(date_day, 
                date_precise,
                longitude,
                latitude,
                velocity,
                altitude,
                heading,
                accuracy) %>%
  rename(date = date_day,
         time = date_precise)

# Remove airplane obs
joe <- joe %>%
  mutate(remove = 
           date == '2017-02-27' &
           time > '2017-02-27 15:00:00') %>%
  filter(!remove) %>%
  dplyr::select(-remove)
  

devtools::use_data(joe,
                   overwrite = TRUE)


# # Plot day
# plot_day <- function(sub_data){
#   require(maps)
#   map('world')
#   points(sub_data$longitude,
#          sub_data$latitude,
#          col = 'red')
# }
# 
# sub_data <-  joe %>%
#   filter(date == '2017-02-27',
#          time <= '2017-02-27 15:00:00')
# plot_day(sub_data =  sub_data)
# plot_day(day = '2017-03-02')

# library("ggmap")
# maptile <- get_map(location=c(lon=((max(df$longitude) + min(df$longitude)) / 2),
#                               lat=((max(df$latitude) + min(df$latitude)) / 2)), zoom=2)
# mymap <- ggmap(maptile) + geom_path(data=df, aes(x=longitude, y=latitude), size=1.1) +
#   theme_void()
# mymap
