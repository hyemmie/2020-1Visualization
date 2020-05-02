#4 types of Visualization

#4-1 Data Wragling

library(gapminder)
library(dplyr)
library(ggplot2)

# Sort in ascending order of lifeExp
gapminder %>% arrange(lifeExp)

# Sort in descending order of lifeExp
gapminder %>% arrange(-lifeExp)



# Use mutate to change lifeExp to be in months
gapminder %>% mutate(lifeExp = 12*lifeExp)

# Use mutate to create a new column called lifeExpMonths
gapminder %>% mutate(lifeExpMonths = 12*lifeExp) 


# Filter, mutate, and arrange the gapminder dataset
gapminder %>% filter(year == 2007) %>%
              mutate(lifeExpMonths = 12*lifeExp) %>%
              arrange(desc(lifeExpMonths))


#4-2 Data Visualization

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Create a scatter plot with pop on the x-axis and lifeExp on the y-axis
ggplot(gapminder_1952,aes(x=pop, y=lifeExp)) + geom_point()


# Change this plot to put the x-axis on a log scale
ggplot(gapminder_1952, aes(x = pop, y = lifeExp)) +
  geom_point() + scale_x_log10()

# Scatter plot comparing pop and gdpPercap, with both axes on a log scale
ggplot(gapminder_1952, aes(x=pop, y=gdpPercap)) + geom_point() + scale_x_log10() + scale_y_log10() 

# Add the size aesthetic to represent a country's gdpPercap
ggplot(gapminder_1952, aes(x = pop, y = lifeExp, color = continent, size=gdpPercap)) +
  geom_point() +
  scale_x_log10()

# Scatter plot comparing gdpPercap and lifeExp, with color representing continent
# and size representing population, faceted by year
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, color=continent, size=pop)) + scale_x_log10() + geom_point() + facet_wrap( ~year)  

# Scatter plot comparing pop and lifeExp, faceted by continent
ggplot(gapminder_1952, aes(x=pop, y=lifeExp))+geom_point()+ scale_x_log10()+ facet_wrap(~ continent)

#4-3 Grouping and summarizing

# Summarize to find the median life expectancy
gapminder %>% summarize(medianLifeExp = median(lifeExp))

# Filter for 1957 then summarize the median life expectancy and the maximum GDP per capita
gapminder %>% filter(year==1957) %>%
              summarize(medianLifeExp = median(lifeExp) ,
              maxGdpPercap = max(gdpPercap))

# Find median life expectancy and maximum GDP per capita in each continent in 1957
gapminder %>%
          filter(year==1957) %>%
          group_by(continent) %>%
          summarize(medianLifeExp = median(lifeExp), 
          maxGdpPercap = max(gdpPercap))

# Summarize the median GDP and median life expectancy per continent in 2007
by_continent_2007 <- gapminder %>%
                      filter(year==2007) %>%
                      group_by(continent) %>%
                      summarize(medianLifeExp = median(lifeExp),
                      medianGdpPercap = median(gdpPercap))

# Use a scatter plot to compare the median GDP and median life expectancy
ggplot(by_continent_2007, aes(x=medianGdpPercap, y=medianLifeExp), color=continent) + geom_point()+expand_limits(y=0)


# Create a line plot showing the change in medianGdpPercap by continent over time
ggplot(by_year_continent, aes(x=year, y=medianGdpPercap, color=continent)) + geom_line() + expand_limits(y=0)


# Create a bar plot showing medianGdp by continent
ggplot(by_continent, aes(x=continent, y=medianGdpPercap)) +geom_col()

# Filter for observations in the Oceania continent in 1952
oceania_1952 <- gapminder %>%
                filter(continent=="Oceania", year==1952)
              

# Create a bar plot of gdpPercap by country
ggplot(oceania_1952, aes(x=country, y=gdpPercap)) + geom_col()


gapminder_1952 <- gapminder %>%
  filter(year == 1952) %>%
  mutate(pop_by_mil = pop / 1000000)

# Create a histogram of population (pop_by_mil)
ggplot(gapminder_1952, aes(x=pop_by_mil)) + geom_histogram(bins=50)


gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Create a histogram of population (pop), with x on a log scale
ggplot(gapminder_1952, aes(x=pop)) +geom_histogram() + scale_x_log10()


gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Create a boxplot comparing gdpPercap among continents
ggplot(gapminder_1952, aes(x=continent, y=gdpPercap)) + geom_boxplot() +scale_y_log10()


# Add a title to this graph: "Comparing GDP per capita across continents"
ggplot(gapminder_1952, aes(x = continent, y = gdpPercap)) +
  geom_boxplot() +
  scale_y_log10() + labs(title = 'Comparing GDP per capita across continents')

#Asia outlier 알아보고 싶어서..
gapminder_asia_1952 <- gapminder %>% filter(continent=='Asia', year==1952) 
top <- gapminder_asia_1952 %>% arrange(desc(gdpPercap))

top