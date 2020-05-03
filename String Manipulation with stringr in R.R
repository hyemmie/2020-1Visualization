#String Manipulation with stringr in R

# 1.String basics

# Define line1
line1 <- "The table was a large one, but the three were all crowded together at one corner of it:"
# Define line2
line2 <- '"No room! No room!" they cried out when they saw Alice coming.'
# Define line3
line3 <- "\"There's plenty of room!\" said Alice indignantly, and she sat down in a large arm-chair at one end of the table."



# Putting lines in a vector
lines <- c(line1, line2, line3)
# Print lines
print(lines)
# Use writeLines() on lines
writeLines(lines)
# Write lines with a space separator
writeLines(lines, sep=" ")
# Use writeLines() on the string "hello\n\U1F30D"
writeLines("hello\n\U1F30D")



# Should display: To have a \ you need \\
writeLines("To have a \\ you need \\\\")
# Should display: 
# This is a really 
# really really 
# long string
writeLines("This is a really\nreallyreally\n long string")
# Use writeLines() with 
# "\u0928\u092e\u0938\u094d\u0924\u0947 \u0926\u0941\u0928\u093f\u092f\u093e"
writeLines("\u0928\u092e\u0938\u094d\u0924\u0947 \u0926\u0941\u0928\u093f\u092f\u093e")



# Some vectors of numbers
percent_change  <- c(4, -1.91, 3.00, -5.002)
income <-  c(72.19, 1030.18, 10291.93, 1189192.18)
p_values <- c(0.12, 0.98, 0.0000191, 0.00000000002)
# Format c(0.0011, 0.011, 1) with digits = 1
format(c(0.0011, 0.011, 1), digits=1)
# Format c(1.0011, 2.011, 1) with digits = 1
format(c(1.0011, 2.011, 1), digits=1)
# Format percent_change to one place after the decimal point
format(percent_change, digits=2)
# Format income to whole numbers
format(income, digits=2)
# Format p_values in fixed format
format(p_values, scientific=FALSE)



formatted_income <- format(income, digits = 2)
# Print formatted_income
formatted_income
# Call writeLines() on the formatted income
writeLines(formatted_income)
# Define trimmed_income
trimmed_income <- format(income, digits=2,trim=TRUE)
# Call writeLines() on the trimmed_income
writeLines(trimmed_income)
# Define pretty_income
pretty_income <- format(income,digits=2,big.mark=",")
# Call writeLines() on the pretty_income
writeLines(pretty_income)



# From the format() exercise
x <- c(0.0011, 0.011, 1)
y <- c(1.0011, 2.011, 1)
# formatC() on x with format = "f", digits = 1
formatC(x, format="f",digits=1)
# formatC() on y with format = "f", digits = 1
formatC(y, format="f",digits=1)
# Format percent_change to one place after the decimal point
formatC(percent_change, format="f",digits=1)
# percent_change with flag = "+"
formatC(percent_change, format="f",digits=1,flag="+")
# Format p_values using format = "g" and digits = 2
formatC(p_values, format="g",digits=2)



# Add $ to pretty_income
paste("$",pretty_income,sep=" ")
# Add % to pretty_percent
paste(pretty_percent,"%",sep="")
# Create vector with elements like 2010: +4.0%`
year_percent <- paste(years,paste(pretty_percent,"%",sep=""),sep=": ")
# Collapse all years into single string
paste(year_percent,collapse=",")



# Define the names vector
income_names <- c("Year 0", "Year 1", "Year 2", "Project Lifetime")
# Create pretty_income
pretty_income <- format(income,digits=2,big.mark=",")
# Create dollar_income
dollar_income <- paste("$",pretty_income,sep="")
# Create formatted_names
formatted_names <- format(income_names, justify="right")
# Create rows
rows <- paste(formatted_names,dollar_income,sep="   ")
# Write rows
writeLines(rows)



# Randomly sample 3 toppings
my_toppings <- sample(toppings, size = 3)
# Print my_toppings
my_toppings
# Paste "and " to last element: my_toppings_and
my_toppings_and <- paste(c("","","and "),my_toppings,sep="")
# Collapse with comma space: these_toppings
these_toppings <- paste(my_toppings_and, collapse=", ")
# Add rest of sentence: my_order
my_order <- paste("I want to order a pizza with ",these_toppings,".",sep="")
# Order pizza with writeLines()
writeLines(my_order)

# 2.Introducing stringr

library(stringr)
my_toppings <- c("cheese", NA, NA)
my_toppings_and <- paste(c("", "", "and "), my_toppings, sep = "")
# Print my_toppings_and
my_toppings_and
# Use str_c() instead of paste(): my_toppings_str
my_toppings_str <- str_c(c("","","and "),my_toppings)
# Print my_toppings_str
my_toppings_str
# paste() my_toppings_and with collapse = ", "
paste(my_toppings_and, collapse=", ")
# str_c() my_toppings_str with collapse = ", "
str_c(my_toppings_str, collapse=", ")



library(stringr)
library(babynames)
library(dplyr)

# Extracting vectors for boys' and girls' names
babynames_2014 <- filter(babynames, year == 2014)
boy_names <- filter(babynames_2014, sex == "M")$name
girl_names <- filter(babynames_2014, sex == "F")$name
# Take a look at a few boy_names
head(boy_names)
# Find the length of all boy_names
boy_length <- str_length(boy_names)
# Take a look at a few lengths
head(boy_length)
# Find the length of all girl_names
girl_length <- str_length(girl_names)
# Find the difference in mean length
mean(girl_length)-mean(boy_length)
# Confirm str_length() works with factors
head(str_length(factor(boy_names)))



# Extract first letter from boy_names
boy_first_letter <- str_sub(boy_names,1,1)
# Tabulate occurrences of boy_first_letter
table(boy_first_letter)
# Extract the last letter in boy_names, then tabulate
boy_last_letter <- str_sub(boy_names,-1,-1)
table(boy_last_letter)
# Extract the first letter in girl_names, then tabulate
girl_first_letter <- str_sub(girl_names,1,1)
table(girl_first_letter)
# Extract the last letter in girl_names, then tabulate
girl_last_letter <- str_sub(girl_names,-1,-1)
table(girl_last_letter)



# Look for pattern "zz" in boy_names
contains_zz <- str_detect(boy_names, pattern="zz")
# Examine str() of contains_zz
str(contains_zz)
# How many names contain "zz"?
sum(contains_zz)
# Which names contain "zz"?
boy_names[contains_zz]
# Which rows in boy_df have names that contain "zz"?
boy_df[contains_zz,]



# Find boy_names that contain "zz"
str_subset(boy_names, pattern="zz")
# Find girl_names that contain "zz"
str_subset(girl_names, pattern="zz")
# Find girl_names that contain "U"
starts_U <- str_subset(girl_names, pattern="U")
starts_U
# Find girl_names that contain "U" and "z"
str_subset(starts_U, pattern="z")



# Count occurrences of "a" in girl_names
number_as <- str_count(girl_names, pattern="a")
# Count occurrences of "A" in girl_names
number_As <- str_count(girl_names, pattern="A")
# Histograms of number_as and number_As
hist(number_as)
hist(number_As)
# Find total "a" + "A"
total_as <- number_as+number_As
# girl_names with more than 4 a's
girl_names[total_as>4]



# Some date data
date_ranges <- c("23.01.2017 - 29.01.2017", "30.01.2017 - 06.02.2017")
# Split dates using " - "
split_dates <- str_split(date_ranges, pattern=fixed(" - "))
split_dates



# From previous step
date_ranges <- c("23.01.2017 - 29.01.2017", "30.01.2017 - 06.02.2017")
split_dates_n <- str_split(date_ranges, fixed(" - "), n = 2, simplify = TRUE)
# Subset split_dates_n into start_dates and end_dates
start_dates <- split_dates_n[,1]
end_dates <- split_dates_n[,2]
# Split start_dates into day, month and year pieces
str_split(start_dates, pattern=fixed("."),n=3,simplify=TRUE)



both_names <- c("Box, George", "Cox, David")
# Split both_names into first_names and last_names
both_names_split <- str_split(both_names,pattern=", ",n=2,simplify=TRUE)
# Get first names
first_names <- both_names_split[,2]
# Get last names
last_names <-  both_names_split[,1]



# Split lines into words
words <- str_split(lines, pattern=fixed(" "))
# Number of words per line
lapply(words, length)
# Number of characters in each word
word_lengths <- lapply(words, str_length) 
# Average word length per line
lapply(word_lengths, mean)



# Some IDs
ids <- c("ID#: 192", "ID#: 118", "ID#: 001")
# Replace "ID#: " with ""
id_nums <- str_replace(ids, pattern="ID#: ", replacement="")
# Turn id_nums into numbers
id_ints <- as.numeric(id_nums)



# Some (fake) phone numbers
phone_numbers <- c("510-555-0123", "541-555-0167")
# Use str_replace() to replace "-" with " "
str_replace(phone_numbers, pattern=fixed("-"), replacement=fixed(" "))
# Use str_replace_all() to replace "-" with " "
str_replace_all(phone_numbers, pattern=fixed("-"), replacement=fixed(" "))
# Turn phone numbers into the format xxx.xxx.xxxx
str_replace_all(phone_numbers, pattern=fixed("-"), replacement=".")



# Find the number of nucleotides in each sequence
str_length(genes)
# Find the number of A's occur in each sequence
str_count(genes, pattern=fixed("A"))
# Return the sequences that contain "TTTTTT"
str_subset(genes, pattern=fixed("TTTTTT"))
# Replace all the "A"s in the sequences with a "_"
str_replace_all(genes, pattern=fixed("A"), replacement="_")



# Define some full names
names <- c("Diana Prince", "Clark Kent")
# Split into first and last names
names_split <- str_split(names, pattern=fixed(" "),n=2,simplify=TRUE)
# Extract the first letter in the first name
abb_first <- str_sub(names_split[,1],1,1)
# Combine the first letter ". " and last name
str_c(abb_first,". ",names_split[,2])



# Use all names in babynames_2014
all_names <- babynames_2014$name
# Get the last two letters of all_names
last_two_letters <- str_sub(all_names,-2,-1)
# Does the name end in "ee"?
ends_in_ee <- str_detect(last_two_letters, pattern="ee")
# Extract rows and "sex" column
sex <- babynames_2014$sex[ends_in_ee]
# Display result as a table
table(sex)




