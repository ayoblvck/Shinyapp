sponsorship_list <- read.csv("sponsorship_data.csv")
head(sponsorship_list)

sorted_tab <- sponsorship_list %>%
  arrange(desc(County))

indices <- grep("media", sponsorship_list$Organisation.Name)
INDIC

# Select the rows corresponding to the indices
subset_df <- subset(sponsorship_list, row.names(sponsorship_list) %in% indices)
subset_df <- subset(subset_df, subset_df$Town.City == 'London')
# Print the selected rows
View(subset_df)
write.csv(subset_df, file = "subset.csv", row.names = FALSE)
