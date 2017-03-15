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

# Create chicken data
# http://koaning.io/fun-datasets.html
frangos <- readr::read_csv('chickweight.csv')
frangos$rownum <- NULL
# Jitter time
frangos$Time <- jitter(frangos$Time, factor = 5)
frangos$Time <- ifelse(frangos$Time <0, 0, frangos$Time)

# Lowercase the names
names(frangos) <- tolower(names(frangos))

# Order columns
frangos <- frangos %>%
  dplyr::select(diet,
                chick,
                time, 
                weight) %>%
  arrange(diet, chick, time)

# Create a different diet
frangos <- frangos %>%
  mutate(diet = ifelse(diet == 1, 'corn',
                       ifelse(diet == 2, 'trash',
                              ifelse(diet == 3, 'mixed',
                                     ifelse(diet == 4, 'special', NA)))))

# Rename time and grams
frangos <- frangos %>%
  rename(days = time,
         grams = weight)

devtools::use_data(frangos,
                   overwrite = TRUE)

# # Read fake census data (not reproducible)
# census <- readr::read_csv('/home/joebrew/Documents/databrew.github.io/census.csv')
# 
# devtools::use_data(census,
#                    overwrite = TRUE)


# plot_day <- function(day){
#   require(sp)
#   require(mapview)
#   sub_data <- joe %>%
#     filter(date == day)
#   sub_data <- data.frame(sub_data)
#   coordinates(sub_data) <- ~longitude+latitude
#   mapview::mapview(sub_data)
# }
# plot_day(Sys.Date())

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
