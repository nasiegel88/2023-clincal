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

system(command = "curl -H 'Authorization: token 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' -o merged_cbc_data.csv  'https://raw.githubusercontent.com/nasiegel88/2022-cbc-pdf/main/merged_cbc_data.csv'", intern = TRUE)
