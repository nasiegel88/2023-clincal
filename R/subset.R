svy <- all_weight_points
# Effect of antibiotics on animal weight
no_infection <- svy[grepl("no", svy$infected),]
# convert infection animals to no-infection animals
no_infection$treatment[no_infection$treatment == "ABX_H1N1"] <- 
  "ABX" #ABX animals
no_infection$treatment[no_infection$treatment == "control_H1N1"] <-
  "control" #control animals

# Effect of antibiotics on animal weight in males
no_infection_males <- no_infection[grepl("1", no_infection$sex),]
# convert infection animals to no-infection animals
no_infection_males$treatment[no_infection_males$treatment == "ABX_H1N1"] <-
  "ABX" #ABX animals
no_infection_males$treatment[no_infection_males$treatment == "control_H1N1"] <- "control" #control animals

# Effect of antibiotics on animal weight in males
no_infection_females <- no_infection[grepl("2", no_infection$sex),]
# convert infection animals to no-infection animals
no_infection_males$treatment[no_infection_males$treatment == "ABX_H1N1"] <-
  "ABX" #ABX animals
no_infection_males$treatment[no_infection_males$treatment == "control_H1N1"] <- "control" #control animals

# Effect of flu infection and antibiotic treatment on weight
infection <- svy[grepl("yes", svy$infected),]
# Effect of fli infection antibiotics on animal weight in males
infection_males <- infection[grepl("1", infection$sex),]

# Effect of sex on weight
sex  <- no_infection
# convert infection animals to no-infection animals
sex$treatment[sex$treatment == "ABX_H1N1"] <-"ABX" #ABX animals
sex$treatment[sex$treatment == "control_H1N1"] <- "control" #control animals