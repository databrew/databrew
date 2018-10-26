library(devtools)
library(dplyr)

# Create location history
# https://takeout.google.com/settings/takeout
library(jsonlite)
location_history <- jsonlite::fromJSON(txt = 'Location History.json')$locations
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

# Remove pre 2017 obs
joe <- joe %>%
  filter(date >= '2017-01-01')

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

# Create sentiment scoring data
library(gsheet)
af <- gsheet2tbl('https://docs.google.com/spreadsheets/d/1YNIGN61kf7mTXcJpwvucwjSJt1mD6ne1_TDy6d8-eXA/edit?usp=sharing')
devtools::use_data(af,
                   overwrite = TRUE)
