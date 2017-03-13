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

# Save data
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
devtools::use_data(joe,
                   overwrite = TRUE)


# library("ggmap")
# maptile <- get_map(location=c(lon=((max(df$longitude) + min(df$longitude)) / 2),
#                               lat=((max(df$latitude) + min(df$latitude)) / 2)), zoom=2)
# mymap <- ggmap(maptile) + geom_path(data=df, aes(x=longitude, y=latitude), size=1.1) +
#   theme_void()
# mymap
