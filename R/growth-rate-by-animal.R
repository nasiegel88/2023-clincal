# Growth rate by animal
source("./R/download-data.R")

# Format of webvitals data used in this script
all_weight_points$sex[all_weight_points$sex == "M"] <- "Males"
all_weight_points$sex[all_weight_points$sex == "F"] <- "Females"

# View summary stats
source("./R/subset.R")

# calculate growth rate by animal
df <- no_infection %>%
  group_by(id) %>%
  arrange(age_months, .by_group = TRUE) %>%
  mutate(Growth_rate = ((weight_kg/lag(weight_kg) - 1) * 100)+100)
df %>% distinct(Growth_rate, .keep_all = TRUE)
df[, 11][is.na(df[, 11])] <- 100
merge_file_name <- "./output/excel/animal-growth-percent.xlsx"
write.xlsx(df,merge_file_name)