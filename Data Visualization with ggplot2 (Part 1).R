# Data Visualization with ggplot2 (Part 1)

# 1. Introduction

# Load the ggplot2 package
library(ggplot2)
# Explore the mtcars data frame with str()
str(mtcars)
# Execute the following command
ggplot(mtcars, aes(x = cyl, y = mpg)) +
  geom_point()



# Load the ggplot2 package
library(ggplot2)
# Change the command below so that cyl is treated as factor
ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_point()



# A scatter plot has been made for you
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()
# Replace ___ with the correct column
ggplot(mtcars, aes(x = wt, y = mpg, color = disp)) +
  geom_point()
# Replace ___ with the correct column
ggplot(mtcars, aes(x = wt, y = mpg, size = disp)) +
  geom_point()



# Explore the diamonds data frame with str()
str(diamonds)
# Add geom_point() with +
ggplot(diamonds, aes(x = carat, y = price)) + geom_point()
# Add geom_point() and geom_smooth() with +
ggplot(diamonds, aes(x = carat, y = price)) + geom_point() + geom_smooth()

# 1 - The plot you created in the previous exercise
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point() +
  geom_smooth()
# 2 - Copy the above command but show only the smooth line
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_smooth()

# 3 - Copy the above command and assign the correct value to col in aes()
ggplot(diamonds, aes(x = carat, y = price, colour=clarity)) +
  geom_smooth()

# 4 - Keep the color settings from previous command. Plot only the points with argument alpha.
ggplot(diamonds, aes(x = carat, y = price, colour=clarity)) +
  geom_point(alpha=0.4)



# Create the object containing the data and aes layers: dia_plot
dia_plot <- ggplot(diamonds, aes(x = carat, y = price))
# Add a geom layer with + and geom_point()
dia_plot + geom_point()
# Add the same geom layer, but with aes() inside
dia_plot + geom_point(aes(color = clarity))



# Create the object containing the data and aes layers: dia_plot
dia_plot <- ggplot(diamonds, aes(x = carat, y = price))
# Add a geom layer with + and geom_point()
dia_plot + geom_point()
# Add the same geom layer, but with aes() inside
dia_plot + geom_point(aes(color = clarity))

# 2.Data

