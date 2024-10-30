
# Installations required...
# 
# R --
# https://cran.r-project.org/
# 
# 
# Rstudio --
# https://www.rstudio.com/products/rstudio/download/#download



# pANE Layout
# Tools -> Global Options -> Pane Layout


10 + 2

50 - 30


# abc = "Object.."
# 
# sqrt(123)
# 
# plot(x = 1 : 10,
#      y = 101 : 110)
# 
# a = (-2 * pi) : (2 * pi)
# 
# a = seq(0, pi, length.out = 100)
# 
# b = sin(a)
# 
# plot(x = a, y = b, type = 'l')




############ Short Cuts for R ##################

# CLEAR THE SCREEN  => CTRL + L
# RUN THE SELECTED CODE  => CTRL + ENTER
# RUN THE ENTIRE CODE  => CTRL + ALT + R
# QUIT R  => CTRL + Q
# MULTIPLE LINE COMMENT ==> CTRL + SHIFT + C



############ HOW TO WRITE IN R ##############

# char b = 'home',
# int x = 20;
# bool f = FALSE.

b = 'home'
x = 20
f = FALSE


############ VARIABLE NAME RULES ###############

# 1. Names can include alphabets, numbers, _ and .

place = "delhi"
place20 = 'mumbai'
place_25 = 'Pune'
place.1 = 'Chennai'


# 2. Names shall not start with numbers and _

# 20news = ' title of the ...'
# _news = ' title of the ...'
.news = ' title of the ...'


# 3. No special characters

# place 25 = 'Chandigarh'
# place(125 = 'Jaipur'


# 4. No Keywords

# break = FALSE
# if = 'Hi'



############# DATA TYPES ############

## Fundamentals / Atomic Vectors 
# character, int, double, complex, logical, raw


# 1. character
# they are enclosed in a pair of single or double quotes.

home = 'Delhi'
work = " Gurugram "


# 2. Double = Floating point numbers.

x = 10
y = 25.45

typeof(x)
typeof(y)


# 3. Integer = Insert "L" along with number

a = 10L
typeof(a)


# 4. Logicals - TRUE  (1, T),   FALSE (0, F)

f = T
typeof(f)

f = FALSE
typeof(f)


# 5. Complex = Real + (i)Imaginary

c1 = 10 - 30i
c1
typeof(c1)

c2 = complex(real = 45, imaginary = 1)
c2



# 6. Raw - converts character to the hexadecimal ASCII value

charToRaw('AB')
charToRaw('Hello Worlds 2021')





############### ENVIRONMENT VARIABLES ###########



home
exp(res)

# displays all the environment variables
ls()

# remove the environment variable
rm(place_25)


# remove all the environment variable
rm(list = ls())




########### WORKING DIRECTORY ########

# check working directory
getwd()

# change working directory
setwd('C:\\Users\\Nitish\\Desktop\\R Batch, 15.11.21')



############# HELP ##################

# 1. Menu -> Help -> R Help
# 
# 2. Pane Layout -> help
# 
# 3. help(functionName)
# help(getwd)
# 
# 
# 4. ?functionName
# ?matrix(1 : 4, nrow = 2, ncol = 2)


############## VERSION INFORMATION ###########

sessionInfo()  # R version

packageVersion('ggplot2') # package version




############## Display & Take Value ############

print(10 ** 5)
print('Sky High')
print('Sky High', quote = FALSE)


print(c(10, 'Hi', FALSE, 45.25), quote = FALSE)
paste(10, 'Hi', FALSE, 45.25)   # ~ Python Print


name = readline('Enter Name : ')
name


age = readline('mention age : ')











############ COERCION / TYPE CASTING ##############

# as.className(objectName)

x = FALSE
typeof(x)
x = as.integer(x)
typeof(x)


x = '100'
typeof(x)
x = as.double(x)
typeof(x)


x = 54
typeof(x)
x = as.logical(x)
typeof(x)


sal = as.double(readline('Enter Salary : '))
sal





###############  DATA TYPE CHECKING ###########

# typeof(variableName)
# is.className(variableName)

x = FALSE

is.logical(x)
is.integer(x)
is.data.frame(x)


m = matrix(1 : 4, nrow = 2)
m

v = c(1 : 10)
v

lt = list(1 : 10, 2 : 5)
lt

f = factor(1 : 10)
f

typeof(m)
typeof(v)
typeof(lt)
typeof(f)

is.vector(v)
is.matrix(m)
is.factor(f)
is.list(lt)





############# PACKAGE ###############

# collection of R files and packages..

######## Importing the Package 

## Python
# import packageName, from packageName import moduleName


# R 
# library(packageName)

library(ggplot2)
ggplot()


library(dplyr)
group_by()



library()  # Shows all the R packages


######## Installing the Package 

## Python => pip install packageName

# R => install.packages(packageName)

install.packages('vioplot')

library(vioplot)




############ Install Packages ###########

# readxl => reading spreadsheets
# dplyr => data manipulation
# fastdummies => categrocial to numerical
# ggplot2 => visualization













