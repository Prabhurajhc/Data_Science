
########### Day6 - 23.11.21 - Dataframes Ops ###################


set.seed(21)
listName = list("P1" = seq(10, 150, 10),
                "P2" = rep(c('red', 'green', 'blue'), 5),
                "P3" = round(runif(15, 25, 50), 2))


df = as.data.frame(listName)
df


######## CATEGORICAL TO NUMRICAL ###################

# pandas get dummies
# sklearn one hot encoding and label encoder

df2 = df

## Extract column names which are character type
vec = c()
for ( i in 1 : ncol(df)){
  if (  is.character(df[ , i])){
    vec = append(vec, colnames(df[i]))
  }
}

vec


# a. fastdummies  ~ pandaas get dummies
# Import the package
# Create dummy variables
# Drop the categorical column


library(fastDummies)
df2 = df

df2 = dummy_cols(.data = df2, select_columns = c('P2'),
                 remove_first_dummy = TRUE)

df2
df2 = df2[-2]

# r g b
# 0 0 
# 1 0  
# 0 1  



# b. Factor

df2 = df
df2

f1 = factor(df2$P2, levels = c('red', 'green', 'blue'))
f2 = factor(df2$P2, levels = c('red', 'green', 'blue'),
            labels = 0 : 2)
f3 = factor(df2$P2, levels = c('red', 'green', 'blue'),
            labels = 0 : 2, ordered = TRUE)


f1
f2
f3

f2[1] > f2[2]
f3[1] > f3[2]


df2$P2 = factor(df2$P2, levels = c('red', 'green', 'blue'),
               labels = 0 : 2, ordered = TRUE)

df2

str(df2)

df2$P2[1] > df2$P2[2]



################ NA VALUES #####################

df3 = df
df3

df3[1, 1] = NA
df3[3, 3] = NA
df3[2, 2] = NA
df3[3, 2] = NA

## check for NA
df3[is.na(df3)]
df3[!is.na(df3)]


# Count NA column wise
colSums(is.na(df3))


## Understanding NA

NA + 10
NA - 20
NA / 10

v1 = c(1, NA, -10, NA, 21)
v1

mean(v1, na.rm = TRUE)
median(v1, na.rm = TRUE)
min(v1, na.rm = TRUE)
max(v1, na.rm = TRUE)
sum(v1, na.rm = TRUE)



v2 = c(1, -10, 21)

mean(v2)


## Imputing NA with MEAN in 'P1'

df3$P1[is.na(df3$P1)]

mean(df3$P1, na.rm = TRUE)



df3$P1[is.na(df3$P1)] <- mean(df3$P1, na.rm = TRUE)

df3



## Imputing NA with MEDIAN in 'P3'

df3$P3[is.na(df3$P3)]

median(df3$P3, na.rm = TRUE)


df3$P3[is.na(df3$P3)] <- median(df3$P3, na.rm = TRUE)

df3



## Imputing NA with MODE in 'P2'

mode(df3$P2)

# df3$P2[!is.na(df3$P2)]

u_value = unique(df3$P2)
is.vector(u_value)

match(df3$P2, u_value)
tabulate(match(df3$P2, u_value))

which.max(tabulate(match(df3$P2, u_value)))

u_value[which.max(tabulate(match(df3$P2, u_value)))]


mode_fun <- function(x){
  u_value = unique(x)
  u_value[which.max(tabulate(match(x, u_value)))]
  
}


mode_fun(df3$P2)
mode_fun(v1)


df3$P2[is.na(df3$P2)] <- mode_fun(df3$P2)




############# QUERIES ############

# filter the records
# df[row, column]
# df[ which(), c()]

df

# filter the records where P3 is more than its mean
mean(df3$P3)

df[ which( df3$P3 > mean(df3$P3)                         ), ]


# filter the records where P3 is more than its mean
# and P1 is less than 100

df[ which( ( df3$P3 > mean(df3$P3) ) &  ( df$P1 <= 100  )  ), ]


# filter the records where P3 is more than its mean
# and P1 is less than 100
# and P2 is green


df[ which( ( df3$P3 > mean(df3$P3) ) &  ( df$P1 <= 100  ) &  ( df$P2 == 'green'  ) ), ]


df[ which( ( df$P1 <= 100  ) &  ( df$P2 == 'green'  ) ), ]
df[ which( ( df$P1 <= 100  ) |  ( df$P2 == 'green'  ) ), ]
df[ which( !( df$P1 <= 100  ) &  ( df$P2 == 'green'  ) ), ]


# filter the records where P3 is more than its mean
# and P1 is less than 100
# and P2 is green
# Show the dataset except P2

df[ which( ( df3$P3 > mean(df3$P3) ) &  ( df$P1 <= 100  ) &  ( df$P2 == 'green'  ) ), c("P1", "P3") ]

df[ which( ( df3$P3 > mean(df3$P3) ) &  ( df$P1 <= 100  ) &  ( df$P2 == 'green'  ) ), -2]


is.data.frame(df)
q1 = df[ which( ( df3$P3 > mean(df3$P3) ) &  ( df$P1 <= 100  ) &  ( df$P2 == 'green'  ) ), -2]
q1

is.data.frame(q1)


rownames(df)
rownames(q1)

# extract where color is blue in P2
q2 = df[ which( df$P2 == 'blue' ), ]
q2

rownames(q2)





####################### DPLYR ##############################
# Data Operations packages.
# Import the package

set.seed(21)
listName = list("Ball" = seq(10, 150, 10),
                "Basketball" = rep(c('red', 'green', 'blue'), 5),
                "Football" = round(runif(15, 25, 50), 2))


df = as.data.frame(listName)
df



library(dplyr)

# 1. select => used to select the columns
# select(dfName, colNames...)

# read column Football

df$Football
df[ , 3]
df[ , "Football"]

select(df, 'Football')
select(df, 3)
select(df, Football)



# read entire dataset except Football
df[ , -3]
df[, -'Football']

df[ , 1 : 2]
df[ , c("Ball", 'Basketball')]

select(df, -3)
select(df, Ball, Basketball)
s1 = select(df, -Football)
s1


df
select(df, starts_with("Ba"))
select(df, ends_with('all'))
select(df, contains('tb'))


# 2. Filter => Queries on Records
# filter(dfName, q1, q2...)

df

# extract records where basketball is green

df[ which(df$Basketball == 'green'), ]

filter(df, Basketball == 'green')


# extract records where basketball is green
# and Ball is more than 100

df[ which(df$Basketball == 'green'  &  ( df$Ball >= 100  ) ), ]

filter(df, Basketball == 'green', Ball >= 100)
filter(df, ( (Basketball == 'green') &  (Ball >= 100) ) )


# extract records where football is less than median

df[  which(df$Football < median(df$Football)) , ]

filter(df, Football < median(Football) )



# extract records where football is less than median
# Display dataset for basketball only
df[  which(df$Football < median(df$Football)) , c('Basketball')]

q5 = filter(df, Football < median(Football) )
q5
select(q5, Basketball)




# 3. Pipe line Operator ( %>% ) : 

# s(q(a()))
# a -> q -> s

# a %>%
#   q %>%
#   s


# extract records where football is less than median
# Display dataset for basketball only
df[  which(df$Football < median(df$Football)) , c('Basketball')]

q5 = filter(df, Football < median(Football) )
q5
select(q5, Basketball)


filter(df, Football < median(Football) ) %>%
  select(Basketball)
  
d1 = df %>%
filter(Football < median(Football) ) %>%
  select(Basketball)

d1




# 4. arrange
# arrange(dfName, colName...)

df %>%
  arrange(Football)


df %>%
  arrange( desc(Ball)  )



# 5. rename the colname
# rename(dfName, newName = oldName)

colnames(df)

rename(df, Vollyball = Basketball, "Tennis Ball" = Football)


## 6. Mutate...
# create new columns and transofrm the existing columns
# mutate(dfName, op1, op2...)


#creating column using mutate
# mutate(df, avg_ = (Ball + Football) / 2, Vollyball =  rep(c(T, F, F), 5))

df %>%
  mutate( avg_ = (Ball + Football) / 2 )


df2 = df %>%
  mutate( avg_ = (Ball + Football) / 2, Vollyball =  rep(c(T, F, F), 5))

df2



# transforming existing columns

sd(df$Ball)

df %>%
  mutate(Ball = Ball - sd(Ball))

fun_A = function(x){
  x = factor(x, labels = 0 : 2)
}


df %>%
  mutate(Ball = Ball - sd(Ball), 
         Basketball = fun_A(df$Basketball),
         Football = Football / 10)










