# calcuate zscores for all uninfected weight points. Discrete monthly scale.
sub = no_infection[,c("sex","treatment","id" , "age_months", "weight_kg")]
sub$id <- as.factor(sub$id)
sub$age_months <- as.factor(sub$age_months)
sub$treatment <- as.factor(sub$treatment)
sub$weight_zscore <- ave(sub$weight_kg, sub$sex, sub$age_months, FUN=scale)
# calculcate z scores using the CNPRC animals as our population mean. Discrete monthly scale.
age_months = (0:6)
no_infection$id <- as.factor(no_infection$id)
no_infection_subset = no_infection[,c("id","sex" ,"treatment","age_months" ,"weight_kg")]
sd = c(0.089, 0.107, 0.134, 0.195, 0.198, 0.202, 0.189)
mean = c(0.514, 0.666, 0.799, 0.948, 1.067, 1.252, 1.402)
cnprc_males <- data.frame(age_months, sd, mean)
males = no_infection_subset[grepl("Males" , no_infection_subset$sex),]
females = no_infection_subset[grepl("Females" , no_infection_subset$sex),]
male.final <-males %>%
  group_by(age_months,id , treatment, sex) %>%
  summarise_all("mean")
mdf <- left_join(male.final, cnprc_males, by = "age_months")
sd = c(0.089, 0.082, 0.129, 0.135, 0.225, 0.18, 0.188)
mean = c(0.491, 0.614, 0.777, 0.894, 1.022, 1.186, 1.322)
cnprc_females <- data.frame(age_months, sd, mean)
female.final <-females %>%
  group_by(age_months,id ,treatment, sex) %>%
  summarise_all("mean")
fdf <- left_join(female.final, cnprc_females, by = "age_months")
data <- rbind(mdf, fdf)
data2 = data[,c("age_months","id" ,"treatment","sex" ,"weight_kg", "sd", "mean")]

dd <- transform(data2, weight_zscore = weight_kg - mean / sd)

dd = dd[,c("sex","treatment","id" , "age_months", "weight_kg", "weight_zscore")]
dd$age_months <- as.factor(dd$age_months)
dd$treatment <- as.factor(dd$treatment)
dd <- dd %>%
  arrange(id)
dd <- as_tibble(dd)
# Now, lets do a continous scale and replace age_months for age days \
# starting with the uninfected animals
cont = no_infection[,c("sex","treatment","id" , "age_days", "weight_kg")]
cont$id <- as.factor(cont$id)
cont$age_days <- as.integer(cont$age_days)
cont$treatment <- as.factor(cont$treatment)
cont$weight_zscore <- ave(cont$weight_kg, FUN=scale)
# Lastly, lets do the same with the CNPRC parameter
age_months = (0:6)
diff = no_infection[,c("id","sex" ,"treatment","age_months" ,"age_days" ,"weight_kg")]
males.2 = diff[grepl("Males" , diff$sex),]
females.2 = diff[grepl("Females" , diff$sex),]
sd = c(0.089, 0.107, 0.134, 0.195, 0.198, 0.202, 0.189)
mean = c(0.514, 0.666, 0.799, 0.948, 1.067, 1.252, 1.402)
cnprc_males <- data.frame(age_months, sd, mean)
males.2$age_days <- as.factor(males.2$age_days)
male.final.2 <-males.2 %>%
  group_by(age_months, age_days,id , treatment, sex) %>%
  summarise_all("mean")
mdf.2 <- left_join(male.final.2, cnprc_males, by = "age_months")
sd = c(0.089, 0.082, 0.129, 0.135, 0.225, 0.18, 0.188)
mean = c(0.491, 0.614, 0.777, 0.894, 1.022, 1.186, 1.322)
cnprc_females <- data.frame(age_months, sd, mean)
females.2$age_days <- as.factor(females.2$age_days)
female.final.2 <-females.2 %>%
  group_by(age_months, age_days,id ,treatment, sex) %>%
  summarise_all("mean")
fdf.2 <- left_join(female.final.2, cnprc_females, by = "age_months")
data <- rbind(mdf.2, fdf.2)
data.1 = data[,c("age_months", "age_days" ,"id" ,"treatment","sex" ,"weight_kg", "sd", "mean")]
ddc <- transform(data.1, weight_zscore = weight_kg - mean / sd)
ddc = ddc[,c("sex","treatment","id" , "age_days", "weight_kg", "weight_zscore")]
ddc$age_days <- as.integer(ddc$age_days)
ddc$treatment <- as.factor(ddc$treatment)
ddc$sex <- as.factor(ddc$sex)
ddc <- ddc %>%
  arrange(id)