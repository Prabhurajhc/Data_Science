

########### Day4 - 18.11.21 - while, functions, matrix ###################

## Q. Factorial of a number
# 5! = 5 * 4 * 3 * 2 * 1

num = 5
fact = 1

for (i in num : 1){
  fact = fact * i
}

fact

# fact = 
# 1 * 5, 
# 1 * 5 * 4, 
# 1 * 5 * 4 * 3
# 1 * 5 * 4 * 3 * 2
# 1 * 5 * 4 * 3 * 2 * 1


######### WHILE LOOP ##############

# iterator = value
# while(iterator < > range_){
#   statements...
#   statements...
#   statements...
#   
#   iterator = iterator +- 1
# }
# 
# 
# while(True){
#   
#   if (expression){
#     break
#   }
#   
#   statements...
#   statements...
#   statements...
#   
#   
# }
# 


## Q. Factorial using while loop

num = 5
fact = 1
iterator = 1

while(iterator <= num){
  fact = fact * iterator
  iterator = iterator + 1
}

fact

# fact      : 1 * 1, 1 * 1 * 2, 1 * 1 * 2 * 3, 1 * 1 * 2 * 3 * 4, 1 * 1 * 2 * 3 * 4 * 5 
# iterator  : 1, 2, 3, 4, 5



## Q. Take Emp names from the user until '**' is used to stop.


emp = c()

while(TRUE){
  name = readline('Employee Name => ')
  
  if (name == "**"){
    break
  }
  
  emp = append(emp, name)

}

print(emp, quote = FALSE)

paste(emp)

joy = 1
while(joy <= length(emp)){
  print(c(joy, emp[joy]), quote = FALSE)
  joy = joy + 1
}


############## REPEAT LOOP ################

# repeat{
#   
#   if (expression){
#     break
#   }
# 
#   statements...
#   statements...
#   statements...
# }

## repeat  ~ while infinite



emp = c()

repeat{
  name = readline('Employee Name => ')
  
  if (name == "**"){
    break
  }
  
  emp = append(emp, name)
  
}

emp




################## FUNCTIONS #####################

## Python syntax
# def functionName(a1, a2...) : 
#   statements...
#   statements...
#   statements...
#   statements...
#   
#   value = 
#     
#   return value


## R syntax
# functionName = function(a1, a2...){
#   statements...
#   statements...
#   statements...
#   
#   value = .
#   
#   return(value)
# }
# 



# Q. Factorial Program using function...

fact_fun <- function(num){
  i = 1
  fact = 1
  while(i <= num){
    fact = fact * i
    i = i + 1
  }
  
  return(fact)
}


num = 5
print(fact_fun(num))


## Create A function that can extract characters from List 
# and return the new list

fun_1 = function(v){
  output_vec = list()
  for(i in v){
    if(is.character(i)){
      output_vec = append(output_vec, i)
    }
  }
  
  return(output_vec)
}


vec = list("Sky", 25, FALSE, 4L, "K", "Earth", 'See yA.')
for (v in vec){
  print(v)
}

fun_1(vec)



#################### MATRIX ######################

# 2D object having rows and columns
# collection of homogeneous elements
# matrix(data, nrow = 1, ncol = 1, dimnames, byrow)


### How to write matrix #####

s1 = seq(10, 180, 15)

m1 = matrix(s1)
m1

# n = 12
# r = 6
# c = ??
m2 = matrix(s1,
            nrow = 6)
m2


m3 = matrix(s1,
            ncol = 3)
m3



m4 = matrix(s1,
            ncol = 3, nrow = 4)
m4


m5 = matrix(s1,
            ncol = 2, nrow = 2)
m5



## recycling..

m6 = matrix(s1,
            ncol = 6, nrow = 6)
m6



m7 = matrix(s1,
            ncol = 10, nrow = 10)
m7



## filling row wise

m8 = matrix(s1,
            ncol = 2, byrow = TRUE)
m8



############ MATRIX OPERATIONS #################

## 1. Lentgh

set.seed(9)
mat = matrix(as.integer(runif(30, 1, 50)),
             nrow = 10)

mat


length(mat)


## 2. Indexing and Slicing
# matrixName[row, column]

set.seed(9)
mat = matrix(as.integer(runif(30, 1, 50)),
             nrow = 10)

mat

# read 2nd row
mat[2, ]

# read 1st col
mat[, 1]


# read first 6 rows
mat[1 : 6, ]



#       [, 2] [,3]
# [1,]   6   45
# [2,]   1    2
# [3,]   44   16
# [8,]   48   19
# [9,]   18   48
# [10,]  25   42

mat[ -(4 : 7), 2 : 3]
mat[c(1 : 3, 8 : 10), 2 : 3]
mat[c(1 : 3, 8 : 10), -1]


#       [,3]
# [1,]  45
# [4,]  6
# [5,]  26
# [8,]  19
# [10,] 42
mat[c(1,4,5,8,10), 3]


# 3. Naming a Matrix
# rownames()
# colnames()

set.seed(9)
m1 = matrix(as.integer(runif(30, 1, 50)),
             nrow = 10, dimnames = list(LETTERS[1 : 10], c('X1', 'X2', 'X3')))

m1



set.seed(9)
m2 = matrix(as.integer(runif(30, 1, 50)),
            nrow = 10)

m2

rownames(m2) <- letters[11 : 20]
colnames(m2) = c("Blue", "Green", "Red")






set.seed(9)
m1 = matrix(as.integer(runif(30, 1, 50)),
            nrow = 10, dimnames = list(LETTERS[1 : 10], c('X1', 'X2', 'X3')))

m1

# read entire data except 3rd column
m1[, -'X3']
m1[, -3]


# read 
#   X1 X2 X3
# A 11  6 45
# B  2  1  2
# C 11 44 16
# D 11 15  6
# E 22 25 26
# F  7 25 45
# G 20 20 20
# H 19 48 19
# I 33 18 48
# J 49 25 42
# 

# Read below;
#   X1 X2 X3
# C 11 44 16
# D 11 15  6
# E 22 25 26

m1[ c("C", 'D', 'E') ,  ]
m1[ 3 : 5 ,  ]




# matrix operations
m1
m1 * m1
m1 + m1
m1  - m1
m1 / m1














