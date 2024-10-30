

########## Day2 - 16.11.21 - Vectors #################



############# OBJECTS IN R ###############
# vectors, factor, list, matrix, dataframe


################### VECTOR ###################

# 1D object in R
# collection of homogeneous elements
# represented by c()



######## HOW TO CREATE VECTOR ############


## 1. Number Sequence => startPosition : endPosition

# XX python range(start, end, stepsize)

x = 10
typeof(x)
is.vector(x)

v1 = 1 : 10
v1
typeof(v1)
is.vector(v1)


v2 = 1L : 10L
v2
typeof(v2)
is.vector(v2)


v3 = 0.25 : 10
v3
typeof(v3)
is.vector(v3)


v4 = 50 : 42
v4
typeof(v4)
is.vector(v4)



v5 = "25.5" : 35.5
v5
typeof(v5)
is.vector(v5)



## 2. Using c()
# precedence order : char > complex > double > integer > logical

vec1 = c("Hi", 2L, -3.11, 7-4i, FALSE)
vec1
is.vector(vec1)


vec1 = c(2L, -3.11, 7-4i, FALSE)
vec1
is.vector(vec1)


vec1 = c(2L, -3.11, FALSE)
vec1
is.vector(vec1)



vec1 = c(2L, FALSE)
vec1
is.vector(vec1)




vec2 = c(2 : 5, c(TRUE, FALSE))
vec2


# 3. Using Built in functions

# a. Alphabets => letters, LETTERS

a1 = letters[1 : 26]
a1
is.vector(a1)


a2 = LETTERS[26 : 1]
a2
is.vector(a2)

# a1 = letters[1 : 50]
# a1
# is.vector(a1)



# b. seq(from, to, by, length.out)  ~ python range

s1 = seq(from = 1, to = 20)
s1
is.vector(s1)


s2 = seq(from = 20, to = 1)
s2
is.vector(s2)


s3 = seq(from = 20, to = 1, by = -5)
s3
is.vector(s3)


## Create a vector of even numbers in between 0 and 100
seq(from = 0, to = 100, by = 2)

# Create a vector of 25 multiples of 10 starting from 200
seq(from = 200, by = 10, length.out = 25)


seq(10, 100, 10)  # seq(from = 10, to = 100, by = 10)
# xx seq(10, 10, 50) # seq(from = 10, by = 10, length.out = 50)



# c. repeat : rep(x, times, each)  # default is "x" and "times"
# python : print('$' * 3)

# $$$
# $$$---&&&
# $-&$-&$-&
# $-----&&


rep(x = 'A', times = 10)
rep(x = 'A', each = 10)
rep(x = c('z', 'A'), times = 10)
rep(x = c('z', 'A'), each = 10)


rep('$', 3)
rep(c('$', "-", "&"), times = 3)
rep(c('$', "-", "&"), each = 3)
rep(c('$', "-", "&"), times = c(1, 5, 2))



r1 = rep(c('$', "-", "&"), times = c(1, 5, 2))
r1
is.vector(r1)


print(r1, quote = FALSE)



# d. Using random numbers
# runif(n, min, max)
# default it returns n double-numbers
# Default => min = 0, max = 1


runif(3)   # Excel - rand(), python - random.random()

runif(10, 25, 50) # python - random.uniform()

as.integer(runif(10, 25, 50))  # excel - randbetween(25, 50), python - random.randint(25, 50)


r2 = as.integer(runif(10, 25, 50))  # excel - randbetween(25, 50), python - random.randint(25, 50)
r2
is.vector(r2)



set.seed(2)
r3 = as.integer(runif(10, 25, 50))  # excel - randbetween(25, 50), python - random.randint(25, 50)
r3
is.vector(r3)



set.seed(58)
r3 = as.integer(runif(10, 25, 50))  # excel - randbetween(25, 50), python - random.randint(25, 50)
r3
is.vector(r3)




############## VECTOR OPERATIONS ##################

# 1. Length - returns number of elements inside the vector

set.seed(58)
vec = as.integer(runif(10, 25, 50))  # excel - randbetween(25, 50), python - random.randint(25, 50)
vec

length(vec)


# 2. Indexing and Slicing
# vectorName[postion]
# vectorName[start : end]

set.seed(58)
vec = as.integer(runif(10, 25, 50)) 
vec

vec[1]

vec[0]


v1 = runif(10, 25, 50)
v1

v1[0]


v2 = LETTERS[1 : 5]
v2
v2[0]




vec

# read last element
vec[length(vec)]


# read the seq between 3rd and 6th positions
vec[3:6]


# read the elements at odd position numbers
vec[seq(1, length(vec), 2)]

# read below elements
# 33 28 41 48 45 34 31 43 31 39
# 33       48       31 43    39

vec[c(1, 4, 7, 8, 10)]


## reverse the sequence in vector
vec[length(vec) : 1]



# 3. Unary operator (-) 
# returns the sequence except element at that position number
# vectorName[ -position]


a1 = LETTERS[1 : 10]
a1

a1[-2]

# return as below 
# "A" "B" "C" "D" "E" "F" "G" "H" "I" "J"
## "A"                "F" "G" "H" "I" "J"

a1[- (2:5 ) ]



# return as below 
# "A" "B" "C" "D" "E" "F" "G" "H" "I" "J"
#     "B" "C" "D" "E" "F" "G" "H" "I"

a1[ -c(1, length(a1))]
a1[ c(- 1, -length(a1))]


# c(5, 1, 7)
# 1 : 5
# c(1,2,3,4,5)

# return as below : return vector except last 4 elements.
# "A" "B" "C" "D" "E" "F" "G" "H" "I" "J"
# "A" "B" "C" "D" "E" "F" 

a1[ 1 : 6 ]
a1[ ( length(vec) - 3 ) : length(vec) ]
a1[ -( ( length(vec) - 3 ) : length(vec) ) ]  # a1[ -(7 : 10) ]

# a1[ -( length(vec) - 3 : length(vec       ) )                    ]




# 4. Insertion in vector
# append - insert the element at the end position
# append(vectorName, variable)

a1 = LETTERS[1 : 10]
a1

a1[ length(a1) + 1 ] = "Balloon"
a1


a1[ length(a1) + 1 ] = "Green"


a2 = LETTERS[1 : 10]
a2
a2 = append(a2, 'Balloon')
a2

a2 = append(a2, 'Green')



# 5. Updation in vector
# vectorName[Position] = newValue

a1 = LETTERS[1 : 10]
a1

a1[5] = 'RED'
a1

a1[1] = FALSE
a1


# 6. Membership Operator (%in%)
# Returns True if elements is present inside vector
# element %in% seqName

a1 = LETTERS[1 : 10]
a1

print('z' %in% a1)
print('A' %in% a1)



# 7. Math Operations

###### Arithmetic

100 / 10
100 * 10
100 + 10
100 - 10
100 ** 10
100 %/% 10
100 %% 10


100 %/% 18
100 %% 18



#### Relational

100 > 10
100 < 10
100 >= 10
100 <= 10
100 == 10
100 != 10


### Logicals 
# and &
# or |
# not !


print(  (100 > 10) &  (25 == 25)  )
print(  (100 > 10) |  (25 == 25)  )
print(  (100 > 10) |  (25 != 25)  )
print(  (100 > 10) &  !(25 != 25)  )


### math functions

sqrt(100)
exp(3)
log(25)
round(25.55555, 1)


set.seed(3)
vec = as.integer(runif(6, 10, 25))
vec

min(vec)
max(vec)
median(vec)
mean(vec)
sum(vec)
exp(vec)


set.seed(3)
s1 = runif(6, 10, 25)
s1

round(s1, 1)
sqrt(s1)


vec ** 2


c(1, 1) + c(0, -1)
c(1, 1) - c(0, -1)
c(1, 1) * c(0, -1)
c(1, 1) / c(0, -1)




# conditional statement functions NA
# list factor matrix
# dataframe  - NA
# visualizations























