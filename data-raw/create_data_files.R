library(devtools)
library(dplyr)

# Create some fake data
fake_data <- data_frame(letter = letters[1:10],
                        number = 1:10,
                        random_number = sample(1:10000, 10))

# Save
devtools::use_data(fake_data,
                   overwrite = TRUE)

