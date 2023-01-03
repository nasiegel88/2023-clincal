subset_sex <- function(metadata, x) 
{
  metadata %>%
    mutate_at('Sample', as.character) %>%
    filter(sex == x) %>%
    pull(Sample)
}