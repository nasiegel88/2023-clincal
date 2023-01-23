metadata <- read_csv('data/cbc_data.csv')%>%
  group_by(animal_number, age_days) %>%
  slice(which.max(is.na(age_month))) %>%
  mutate(
    spacer = case_when(year == 2 & infection_day == 14 ~ 'no'),
    treatment = if_else(infected == 'no',
                        str_replace(treatment, "control_H1N1", "control"),
                        str_replace(treatment, "control_H1N1", "control_H1N1")),
    treatment = if_else(infected == 'no',
                        str_replace(treatment, "abx_H1N1", "abx"),
                        str_replace(treatment, "abx_H1N1", "abx_H1N1")),
    infected = if_else(is.na(spacer), infected, spacer),
    age_month = replace(age_month, infection_day == 14, 6),
    infection_day = replace(infection_day, age_month == 6, NA)
  ) 

# Convert factors
metadata$animal_number <- as.factor(metadata$animal_number)
metadata$treatment <- factor(metadata$treatment)
metadata$year <- factor(metadata$year)
metadata$sex <- factor(metadata$sex)
metadata$age_month <- factor(metadata$age_month)
metadata$infected <- factor(metadata$infected)
# metadata$infection_day <- factor(metadata$infection_day)
# metadata$infection_day <- factor(metadata$infection_day, levels= c("0", "1", 
#                                                                    "2", "3", "7", "11", "14"))
# Convert dates
metadata$date <- as.Date(metadata$date)
metadata$birth <- as.Date(metadata$birth)
# convert data columnns to numeric
cols <- names(metadata)[10:21] # or column index (change the index if needed)
metadata[cols] <- suppressWarnings(lapply(metadata[cols], as.numeric))

cont <-  transform(metadata, NLR = PMN_ul / Lymph_ul)

cont=cont[,c("year","sex","treatment","animal_number", "infected", "infection_day",  "age_days","age_month" ,"Total_WBC_ul", "PMN_ul", "Lymph_ul", "Mono_ul", "Eos_ul", "NLR")]

cont$WBC_zscore <- ave(cont$Total_WBC_ul, cont$age_days, FUN=scale)

cont$PMN_zscore <- ave(cont$PMN_ul, cont$age_days, FUN=scale)

cont$Lymph_zscore <- ave(cont$Lymph_ul, cont$age_days, FUN=scale)

cont$Mono_zscore <- ave(cont$Mono_ul, cont$age_days, FUN=scale)

cont$Eos_zscore <- ave(cont$Eos_ul, cont$age_days, FUN=scale)

cont$NLR_zscore <- ave(cont$NLR, cont$age_days, FUN=scale)