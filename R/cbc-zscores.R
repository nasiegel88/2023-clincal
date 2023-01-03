metadata = cbc_data
# Convert factors
metadata$animal_number <- as.factor(metadata$animal_number)
metadata$treatment <- factor(metadata$treatment)
metadata$year <- factor(metadata$year)
metadata$sex <- factor(metadata$sex)
metadata$age_month <- factor(metadata$age_month)
metadata$infected <- factor(metadata$infected)
metadata$infection_day <- factor(metadata$infection_day)
metadata$infection_day <- factor(metadata$infection_day, levels= c("0", "1", 
                                                                   "2", "3", "7", "11", "14"))
# Convert dates
metadata$date <- as.Date(metadata$date)
metadata$birth <- as.Date(metadata$birth)
# convert data columnns to numeric
cols <- names(metadata)[10:21] # or column index (change the index if needed)
metadata[cols] <- suppressWarnings(lapply(metadata[cols], as.numeric))

metadata <- transform(metadata, NLR = PMN_ul / Lymph_ul)
# Males and Females
no_infection <- metadata[grepl("no", metadata$infected),]
#no_infection <- no_infection[!grepl("6", no_infection$age_month),]
# convert infection animals to no-infection animals
no_infection$treatment[no_infection$treatment == "abx_H1N1"] <- 
  "abx" #abx animals
no_infection$treatment[no_infection$treatment == "control_H1N1"] <-
  "control" #control animals

cont <- no_infection
cont=cont[,c("year","sex","treatment","animal_number" , "age_days","age_month" ,"Total_WBC_ul", "PMN_ul", "Lymph_ul", "Mono_ul", "Eos_ul", "NLR")]

cont$WBC_zscore <- ave(cont$Total_WBC_ul, cont$age_days, FUN=scale)

cont$PMN_zscore <- ave(cont$PMN_ul, cont$age_days, FUN=scale)

cont$Lymph_zscore <- ave(cont$Lymph_ul, cont$age_days, FUN=scale)

cont$Mono_zscore <- ave(cont$Mono_ul, cont$age_days, FUN=scale)

cont$Eos_zscore <- ave(cont$Eos_ul, cont$age_days, FUN=scale)

cont$NLR_zscore <- ave(cont$NLR, cont$age_days, FUN=scale)
