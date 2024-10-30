
# Day7 - 08.09.21 - df ops, visualization

getwd()
setwd('C:\\Users\\Nitish\\Desktop\\R Batch - 31Aug to 07 Sept 21')

df = read.csv('sample_csv_file.csv')
head(df, 3)



### ------------ VIEW THE DATASET -------------------
# View(dfName)
# watch out the dataset inside R window. 
# get layout of the df
# sort the df, wrt column
# no changes are reflected back


View(df)



# ---------------- Data Editors ------------------------

# 1. EDIT(dfName)
# you can edit the data
# changes are not permanent, if not stored in some variable


head(df, 5)
edit(df)   

df1 = edit(df)
head(df1, 10)


# 2. FIX(dfName)
# you can edit the data
# changes are permanent


fix(df)
head(df, 10)


##### -------------- Categorical to Numerical ----------------

df = read.csv('sample_csv_file.csv')
head(df, 3)
df = unique(df)

names(df)

unique(df$job_desig)
unique(df$location)


# 1. IF ELSE  # get dummies
# create different columns for unique values
# without any ordered
# Base R Package


df$location.Mumbai = ifelse(df$location == "Mumbai", 1, 0)
df$location.Delhi = ifelse(df$location == "Delhi NCR", 1, 0)
df$location.Bengaluru = ifelse(df$location == 'Bengaluru', 1, 0)
df$location.Chennai = ifelse(df$location == "Chennai", 1, 0)
df$location.Ahmedabad = ifelse(df$location == "Ahmedabad", 1, 0)
df$location.Kolkata = ifelse(df$location == 'Kolkata', 1, 0)


head(df, 2)

## drop the location column
df <- df[-3]


# 2. fast dummies : without ordered
# package : fast dummies

df = read.csv('sample_csv_file.csv')
head(df, 3)
df = unique(df)

names(df)

unique(df$job_desig)
unique(df$location)

library(fastDummies)
df <- dummy_cols(df, select_columns = c('location'))
head(df, 2)

## drop the location column
df <- df[-3]



# 3. Factor
# convert categorical to numerical
# add ordered also
# Base R

df = read.csv('sample_csv_file.csv')
head(df, 3)
df = unique(df)

names(df)

unique(df$job_desig)
unique(df$location)


# - no relationship
lev_ = c("Mumbai", "Delhi NCR", "Bengaluru", "Chennai", "Ahmedabad", "Kolkata" )
f1 = factor(df$location)
f1

f1[1]
f1[5]

f1[1] > f1[5]


# adding relationship
lev_ = c("Mumbai", "Delhi NCR", "Bengaluru", "Chennai", "Ahmedabad", "Kolkata" )
f1 = factor(df$location, levels = lev_, ordered = TRUE)
f1

f1[1]
f1[5]

f1[1] > f1[5]


# adding labels to categories
lab_ = 1 : 6

lev_ = c("Mumbai", "Delhi NCR", "Bengaluru", "Chennai", "Ahmedabad", "Kolkata" )
f1 = factor(df$location, levels = lev_, labels = lab_)
f1


# adding labels to categories and ordered

lab_ = 1 : 6

lev_ = c("Mumbai", "Delhi NCR", "Bengaluru", "Chennai", "Ahmedabad", "Kolkata" )
df$location = factor(df$location, levels = lev_, labels = lab_, ordered = TRUE)
df$location

df$location[1] > df$location[5]



##########  --- VISUALIZATION ----

# hist, bar, scatter, box, violin, pie, line, 

# univariate analysis - exploring single column at a time

# bivariate analysis - exploring 2 cols at a time. num vs num, cat vs num, cat vs cat



### PYTHON
# plt.plot(x, y)
# plt.xlabe()
# plt.ylabel()
# plt.title()
# plt.show()

## R PLOT
# args(plot)
# ?plot(x, y, ylab, xlab, main)


x_ = 1 : 10
y_ = seq(10, 100, 10)

plot(x = x_, y = y_, xlab = "X_ POINTS", ylab = 'Y_ POINTS', 
     main = "X_ vs Y_")


plot(x = x_, y = y_, xlab = "X_ POINTS", ylab = 'Y_ POINTS', 
     main = "X_ vs Y_", type = 'p')


plot(x = x_, y = y_, xlab = "X_ POINTS", ylab = 'Y_ POINTS', 
     main = "X_ vs Y_", type = 'l')


plot(x = x_, y = y_, xlab = "X_ POINTS", ylab = 'Y_ POINTS', 
     main = "X_ vs Y_", type = 'b')


plot(x = x_, y = y_, xlab = "X_ POINTS", ylab = 'Y_ POINTS', 
     main = "X_ vs Y_", type = 'o')

plot(x = x_, y = y_, xlab = "X_ POINTS", ylab = 'Y_ POINTS', 
     main = "X_ vs Y_", type = 's')


plot(x = x_, y = y_, xlab = "X_ POINTS", ylab = 'Y_ POINTS', 
     main = "X_ vs Y_", type = 'S')




## Histogram
set.seed(2)
arr1 = as.integer(runif(100, 10, 50))

hist(arr1)
hist(arr1, col = 'red')

hist(arr1, col = 'red', border = 'yellow')



hist(arr1, col = cm.colors(10))


hist(arr1, col = cm.colors(4), breaks = 3)


hist(arr1, col = cm.colors(20), breaks = 20)

# hist(arr1, col = cm.colors(4), breaks = c())



department = c('IT', 'Sales', 'HR', 'Marketing')
emp_count = c(10, 15, 3, 20)

pie(x = emp_count, labels = department)

pie(x = emp_count, labels = department, col = rainbow(10))


#
library(viridis)
pie(x = emp_count, labels = department, col = viridis(5))



pie(x = emp_count, labels = department, col = rainbow(5),
    clockwise = TRUE, angle = 90)


pie(x = emp_count, labels = department, col = rainbow(5),
    clockwise = TRUE, angle = 90, radius = 1)


### SAVING THE FILE

png(filename = 'MyFirstPNG.png')

pie(x = emp_count, labels = department, col = rainbow(5),
    clockwise = TRUE, angle = 90, radius = 1)


dev.off()




pdf(file = 'pdfSAVE.pdf')

pie(x = emp_count, labels = department, col = rainbow(5),
    clockwise = TRUE, angle = 90, radius = 1)

pie(x = emp_count, labels = department, col = viridis(5),
    main = 'Sheet2 PIE')

dev.off()


# BOXPLOT

arr1

bx <- boxplot(arr1)
bx

min(arr1)
quantile(arr1, 0.25)
median(arr1)
quantile(arr1, 0.75)
max(arr1)

# postionNUmber = p * (n + 1) / 100
# postionNUmber = 5.5
# Quatilesvalue = UpperpostionNUmberValue - decimalDiff(UpperpostionNUmberValue - LowerpostionNUmberValue)
#  = 6th - 0.5(6th - 5th)
# 

typeof(bx)
bx$out

bx$stats

bx$conf



## ggplot titanic dataset
library(ggplot2)

#  make 2D / 3D types of charts and graphs
# ggplot = grammer of graphocs plot
# geom_objectName
# objectName - bar, box, pie, hist, line..........


# ggplot(data , mapping = aes(x, y))  +             # fill in aes
#   geom_objectName +                               # object coloring
#   labs(xlab, ylab, title, subtitle)

df = read.csv('titanic.csv')
head(df, 3)


## hist - num col

ggplot(df, aes(x = Age)) + 
  geom_histogram(color = 'green', fill = 'blue') + 
  labs(xlab = 'Age',
       ylab = 'Count',
       title = 'Histogram of Age',
       subtitle = 'Exploring Age Distribution')


names(df)


# bar - cat col
ggplot(df, aes(x = Survived)) + 
  geom_bar(stat = 'count', fill = 'green')


ggplot(df, aes(x = Survived)) + 
  geom_bar(stat = 'count', fill = rainbow(2))   # fill = cm.color(2)




# bivariate - 
# num vs num
#plot()

ggplot(df, aes(x = Age, y = Fare)) + 
  geom_point(color = 'red')



ggplot(df, aes(x = Age, y = Fare, color = Survived)) + 
  geom_point()



ggplot(df, aes(x = Age, y = Fare, color = Sex)) + 
  geom_point()




# cat vs num
ggplot(df, aes(Embarked, Fare)) + 
  geom_boxplot()


colSums(is.na(df))


ggplot(df, aes(Embarked, Fare)) + 
  geom_boxplot(fill = rainbow(4))

unique(df$Embarked)


ggplot(df, aes(Embarked, Fare, color = Sex)) + 
  geom_boxplot()



ggplot(df, aes(Embarked, Fare, color = Sex)) + 
  geom_boxplot(outlier.colour = 'black')


box_1 = ggplot(df, aes(Embarked, Fare, color = Sex)) + 
  geom_boxplot(outlier.colour = 'black', outlier.shape = 4)



## bar plot

ggplot(df, aes(Embarked, Fare, color = Sex)) + 
  geom_bar(stat = 'identity', position = position_dodge(), fill = 'yellow')



## cat vs cat

tb1 = table(df$Survived, df$Sex)
dotchart(tb1)















































