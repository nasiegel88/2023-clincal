temp.file_all_weight_points <- paste(tempfile(),".xlsx",sep = "")
download.file("https://ucdavis.box.com/shared/static/1gdjumy024tuoe2gbte8gln64xpnc7gh.xlsx", 
              temp.file_all_weight_points, mode = "wb")
all_weight_points <- read_excel(temp.file_all_weight_points)


temp.file_cbc <- paste(tempfile(),".xlsx",sep = "") # CBC data
download.file("https://ucdavis.box.com/shared/static/dsmwnxm7nv9r0jckrhj9vmbkwx4jc3sk.xlsx",
              temp.file_cbc, mode = "wb")
cbc_data <- read_excel(temp.file_cbc)
# Clean dataframe
colnames(cbc_data)[2] <- "animal_number"
colnames(cbc_data)[5] <- "age_month"
colnames(cbc_data)[9] <- "birth"


# download data from github until we wrap up study
system(command = "curl -H 'Authorization: token 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' -o /tmp/mld03_cbc.csv  'https://raw.githubusercontent.com/nasiegel88/2022-cbc-pdf/main/merged_cbc_data.csv'", intern = TRUE)

new_data <- read_csv('/tmp/mld03_cbc.csv') %>%
  dplyr::rename(
    animal_number = ID,
    age_month = month,
    
  ) %>%
  mutate(

    animal_number = as.character(animal_number),
    
    .after = animal_number,
    
    # Add treatments
    treatment = 
           case_when(
             startsWith(animal_number, '50583') ~ 'control_H1N1',
             startsWith(animal_number, '50584') ~ 'control_H1N1',
             startsWith(animal_number, '50598') ~ 'control_H1N1',
             startsWith(animal_number, '50706') ~ 'abx_H1N1',
             startsWith(animal_number, '50722') ~ 'abx_H1N1',
             startsWith(animal_number, '50724') ~ 'abx_H1N1',
             startsWith(animal_number, '50674') ~ 'control',
             startsWith(animal_number, '50691') ~ 'control',
             startsWith(animal_number, '50731') ~ 'abx_fmt',
             startsWith(animal_number, '50740') ~ 'abx_fmt',
             startsWith(animal_number, '50752') ~ 'abx_fmt',
             startsWith(animal_number, '50776') ~ 'abx_fmt',
           ),
    
    sex = 'M' # for all 2022 animals
    ) %>%
  mutate(year = 3, .before = animal_number) %>% # for all 2022 animals
  
  # Match data to original table
  select(names(cbc_data)) %>%
  
  mutate_all(as.character) %>%
  
  mutate(
    year = as.numeric(year),
    date = as.Date(date),
    birth = as.Date(birth)
  ) %>%
  
  bind_rows(cbc_data)

write_csv(new_data, 'data/cbc_data.csv')
