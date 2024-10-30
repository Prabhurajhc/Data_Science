
########### Day3 - 17.11.21 - List, Factor, Matrix ###################


#################### LIST OBJECT #################

# ~ Python Dictionary
# 1D object having keys and values
# represented by list()
# Unordered object 
# Mutable



vec = c(seq(10, 100, 10),
        as.integer(runif(5, 150, 200)),
        LETTERS[10 : 16])

vec
is.vector(vec)


set.seed(10)
listName = list(seq(10, 100, 10),
        as.integer(runif(5, 150, 200)),
        LETTERS[10 : 16])

listName



################ LIST  OPERATIONS ###################


# 1. Length - return number of key-value pairs

set.seed(10)
listName = list(seq(10, 100, 10),
                as.integer(runif(5, 150, 200)),
                LETTERS[10 : 16])

listName
is.list(listName)
is.vector(listName)


length(listName)




# 2. Naming  a List => Assigning keyName
# names(listName) <- sequence of list key names

set.seed(10)
listName = list(seq(10, 100, 10),
                as.integer(runif(5, 150, 200)),
                LETTERS[10 : 16])

listName

names(listName) <- c('C1', 'C2', 'C3')


set.seed(10)
listName2 = list("C1" = seq(10, 100, 10),
                 "C2" = as.integer(runif(5, 150, 200)),
                 'C3' = LETTERS[10 : 16])

listName2


# 3. List Value Indexing and Slicing
# listName[[keyPostion]]
# listName$keyName


set.seed(10)
listName = list(seq(10, 100, 10),
                as.integer(runif(5, 150, 200)),
                LETTERS[10 : 16])

listName

set.seed(10)
listName2 = list("C1" = seq(10, 100, 10),
                 "C2" = as.integer(runif(5, 150, 200)),
                 'C3' = LETTERS[10 : 16])

listName
listName2


# extract 1st sequence
listName[[1]]
listName2$C1



# extract 1st sequence and show the first 4 elements
listName[[1]][1 : 4]
listName2$C1[1 : 4]


# extract (N O P) from the list
listName[[3]][5 : 7]
listName2$C3[5 : 7]


# extract 175, 171, 184 from the list
listName[[2]][c(1, 3, 4)]
listName2$C3[c(1, 3, 4)]

a1 = listName[[2]]
is.vector(a1)



# read entire list except alphabetical seq.
listName[[1, 3]]    ## xx will not work as ther is no keyName as 1,3
listName[[-3]]    ## xx will not work as ther is no keyName as -3


# read the 1st seq list except last 2 elements.
listName[[1]]
listName[[1]][1 : 8]
listName[[1]][ -(9 : 10) ]
listName[[1]][ -( (length(listName[[1]]) - 1) : length(listName[[1]])) ]

# c(1 : 10, 20 : 16)
# 1 : 10
# c(5, 7, 1)

listName2$C1
listName2$C1[1 : 8]
listName2$C1[ -(9 : 10)]



# 4&5&6. Insertion 
# listName[[keyPosition]] = newValue
# listName$keyName = newValue



set.seed(10)
listName = list(seq(10, 100, 10),
                as.integer(runif(5, 150, 200)),
                LETTERS[10 : 16])

set.seed(10)
listName2 = list("C1" = seq(10, 100, 10),
                 "C2" = as.integer(runif(5, 150, 200)),
                 'C3' = LETTERS[10 : 16])

listName
listName2


listName2$C3
listName2[[3]]


# insertion in listName
listName[[4]] <- "Hi Dear"
listName[[7]] <- 6 : 1

listName



# insertion in listName2
listName2$X5 = 'Green Blue'
listName2
listName2[[4]]


listName2$`P 6` <- rep('F', 10)
listName2

listName2[[5]]
listName2[[6]]


# 
# Python - df
# dfName = Column1, Column_2, Column 3
# 
# dfName['Column1']
# dfName.Column1
# dfName.Column_2
# dfName.Column 3
# 
# dfName['Column 3']



# 4&5&6. Deletion
# listName[[KeyPosition]] = NULL
# listName$KeyName = NULL

listName
listName[[5]] = NULL


listName2
listName2$`P 6` <- NULL


# 4&5&6. Updation
# listName[[keyPosition]] = newValue
# listName$keyName = newValue


listName
# replace 4th seq by negative number seq.
listName[[4]]
listName[[4]] <- -10 : - 5


listName2
# replace 4th seq by negative number seq.
listName2$X5
listName2$X5 = -10 : -5



##################### FACTOR OBJECT ####################

# 1D object with homogeneous elements
# to convert categorical to numerical with/without priority order
#** Assigns class or categorical meaning to numbers
# factor(x = character(), levels, labels = levels, ordered)

# yes, on == 1, 0
# y = targetColName
# "1" and "0"
# factor -> 1, 0

?factor
args(factor)


shirt_size = c("S", "M", "XL", "XL", "S", "L", "M", 'S', "L")
shirt_size

# a. take a factor

shirt_size = c("S", "M", "XL", "XL", "S", "L", "M", 'S', "L")
shirt_size

f1 = factor(x = shirt_size)
f1

f1[1]
f1[3]

f1[3] > f1[1]


# b. take a factor with priority order

# yes > no, 1 > 0

shirt_size = c("S", "M", "XL", "XL", "S", "L", "M", 'S', "L")
shirt_size

lev_ = c('S', 'M', 'L', 'XL')

f2 = factor(x = shirt_size, levels = lev_, ordered = TRUE)
f2

f2[1]
f2[3]

f2[3] > f2[1]



# c. take a factor with conversion to numerical

shirt_size = c("S", "M", "XL", "XL", "S", "L", "M", 'S', "L")
shirt_size

lev_ = c('S', 'M', 'L', 'XL')

# lab_ = c(10, 20, 50, 100)
lab_ = 1 : 4


f3 = factor(x = shirt_size, levels = lev_, 
            labels = lab_)
f3

f3 = factor(x = shirt_size, levels = lev_, 
            labels = lab_, ordered = TRUE)

f3[1]
f3[3]

f3[3] > f3[1]


###################### CONDITIONAL STATEMENTS ############

# if else, for, while, break, next



## IF ELSE

# if (expression){
#   statements...
#   statements...
#   statements...
# }else if(expression) { 
#   statements...
#   statements...
#   statements...
# }else{
#   statements...
#   statements...
#   statements...
#   }



## Q. Assign a grade on the basis of marks

marks = 45

if (marks >= 80 & marks <= 100){
  print("A")
}else if (marks >= 60 & marks < 80){
  print("B")
}else if (marks >= 40 & marks < 60){
  print("C")
}else {
  print('FAIL')
}


## if a vector is given as character then pass, 
# if it is given as logical, then convert to character,
# else convert it to double.

vec = c(FALSE, T, TRUE)
vec = letters[4 : 8]
vec = 50 : 40


if (is.logical(vec)){
  vec = as.character(vec)
} else if (is.character(vec)){
  NULL  # PYHTON - pass 
} else{
  vec = as.double(vec)
}

vec
typeof(vec)




############# FOR LOOP ######################

## Python
# vec = list(range(10, 100, 10))
# for i in range(0, len(vec)) : 
#   print(vec[i])


# for i in vec : 
#   print(i)


# for (i in range){
#   statements...
# statements...
# statements...
# }

# for (i in vec){
#   print(i)
# 
# }

vec = seq(10, 100, 10)
vec

for (i in 1 : length(vec)){
  print(vec[i])
}

for (i in vec){
  print(i)
}


## Q. create a vector of 5 employee names

emp = c()

for (i in 1 : 5){
  name = readline('Mention Name : ')
  emp = append(emp, name)
}

emp


for (i in emp){
  print(i)
}

for (i in 1 : length(emp)){
  print(emp[i])
}




########## BREAK AND NEXT ##########

set.seed(1)
r1 = as.integer(runif(15, 10, 50))
r1

mean(r1)

# loop through the r1 and if value is more than its mean, then break

for (i in r1){
  if (i > mean(r1)){
    break
  }else{
    print(i)
  }
  
}



# loop through the r1 and if value is more than its mean, then skip that one.

for (i in r1){
  if (i > mean(r1)){
    next
  }else{
    print(i)
  }
  
}



# Revision is required now
# while loops functions matrix







