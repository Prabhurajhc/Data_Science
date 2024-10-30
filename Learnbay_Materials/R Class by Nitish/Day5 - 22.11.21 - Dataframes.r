

########### Day5 - 22.11.21 - Dataframes ###################

########### OBJECT DATAFRAME ##############

# 2d object having rows and columns
# data.frame()

## HOW TO CREATE DATAFRAME

# 1. LIST

listName <- list("C1" = seq(0, by = 12, length.out = 20),
                 "C2" = LETTERS[1 : 20],
                 "C3" = rep(c("$", "#"), 10))

listName

df_list = as.data.frame(listName)
df_list

is.data.frame(df_list)


# 2. MATRIX

set.seed(11)
mat = matrix(as.integer(runif(30, 1, 100)),
             nrow = 10, 
             dimnames = list(LETTERS[1 : 10], c("X1", "X2", "X3")))
mat


df_mat = as.data.frame(mat)
df_mat

object.size(mat)
object.size(df_mat)


# 3. IN BUILT DATASET

# from sklearn.datasets import load_boston, load_iris ...

data()   # show all the datasets


AirPassengers
Orange
Seatbelts
iris

# Orange = 100


df1 = Orange
df2 = Seatbelts

is.data.frame(df1)
is.data.frame(df2)


df1 = as.data.frame(Orange)
df2 = as.data.frame(Seatbelts)




# 4. EXTERNAL DATASET

# 1. Import the Package
# 2. Import the dataset

# install.packages('mlbench')
library(mlbench)


data()

data("BostonHousing")
BostonHousing

BostonHousing

df = as.data.frame(BostonHousing)
head(df)




# 5. CSV FILES

df_csv = read.csv(file = 'data.csv')
head(df_csv)


# separator
df_csv = read.csv(file = 'data.csv', sep = ";")
head(df_csv)


df_csv = read.csv(file = 'data.csv', sep = ",")
head(df_csv)


# header
df_csv = read.csv(file = 'data.csv', sep = ",", 
                  header = FALSE)
head(df_csv)



# skipping records
df_csv_2 = read.csv(file = 'data_2.csv', sep = ",")
head(df_csv_2)

df_csv_2 = read.csv(file = 'data_2.csv', sep = ",",
                    skip = 6)
head(df_csv_2)




# 6. TEXT FILES

df_text = read.csv('data.txt')
df_text


df_text = read.csv('data.txt', sep = '\t')
df_text



# 7. EXCEL FILES

library(readxl)

df_xl = read_excel('data.xlsx')
df_xl


# header
df_xl = read_excel('data.xlsx', col_names = FALSE)
df_xl



# skip
df_xl = read_excel('data.xlsx', skip = 3)
df_xl


# sheet
df_xl = read_excel('data.xlsx', sheet = 2)
df_xl


df_xl = read_excel('data.xlsx', sheet = 'Sheet1')
df_xl



### DATAFRAME OPERATIONS 

# dplyr

# concat, join


set.seed(21)
listName = list("P1" = seq(10, 150, 10),
                "P2" = rep(c('red', 'green', 'blue'), 5),
                "P3" = round(runif(15, 25, 50), 2))


df = as.data.frame(listName)
df



# 1. HEAD => Top records from the dataset
# head(dfName, integerCount)

head(df)
head(df, 1)
head(df, 8)



# 2. TAIL => Bottom records from the dataset
# tail(dfName, integerCount)

tail(df)
tail(df, 1)
tail(df, 8)


# 3. summary = read statistical parameters
# summary(dfName)

summary(df)


# 4. str => datatypes, shape, displays few records

str(df)


# 5. SHape of the dataset

dim(df)


# number of columns
length(df)
ncol(df)
dim(df)[2]

# number of rows
nrow(df)
dim(df)[1]


# 6. Naming the dataframe

df

colnames(df)
rownames(df)

df2 = df

colnames(df2) = c('Sky', 'Earth', 'Ocean')
rownames(df2) <- LETTERS[1 : 15]



# 7. Read the columns
# 


# read 1st column
df['P1']
df$P1
df[ , "P1"]
df[ , 1]

# read first 2 columns
df[ , c("P1", 'P2')]
df[ , c(1 : 2)]
df[ , c(1, 2)]


# 8. Create and Delete Columns


# deleting the columns
# NOTE : no INPLACE operator

df2 = df2[, -1]


# creating the columns
df

df["New Column"] <- letters[1 : 15]

df$avg_ = (df$P1 + df$P3) / 2



## Dropping the last 2 cols

df = df[-4]



# 9. Unique

# show unique values
df_csv = read.csv(file = 'data.csv')
head(df_csv)

unique(df_csv$location)


s1 = unique(df_csv$location)
is.vector(s1)

# number of unique values

df_csv = read.csv(file = 'data.csv')
head(df_csv)

length(unique(df_csv$location))



# drop duplicates

df_csv = read.csv(file = 'data.csv')
head(df_csv)


dim(df_csv)

df_csv <- unique(df_csv)
dim(df_csv)



# 10. Indexing and Slicing
# dfName[colName]
# dfName[row, columns]   # loc helps with names slicing and iloc helps with indexing slicing

df


# first 4 records of the dataset with first 2 columns
df[ 1 : 4 , 1 : 2 ]
df[ 1 : 4 , -3]




#    P3
# 5  48.99
# 8  29.30
# 9  49.65
# 12 48.38
# 15 29.37

df[ c(5,8,9,12,15) , 3]
df[ c(5,8,9,12,15) , "P3"]


# read last 3 rows for 2nd column
df2

df2[ c("M", "N", "O")  , 2]
df2[ 13 : 15  , "Earth"]



























