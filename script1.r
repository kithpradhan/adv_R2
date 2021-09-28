
################################
####Rstudio code#



#run current line with ctrl-enter
x = 7
y = 9
x+y


#comment out selected code with ctrl-shift-C
myFun <- function(x, y){
  #do something
  x + y + 3
}
#myFun(3, 8)
myFun(32, 12)


 
#you can indent and reformat code automatically
#ctrl-shift-A
for (i in 1:10)
{
j = i + 2
print(j)
}





#syntax errors are found as you type!
((3 + 4)/3 + 3)




nterms = 10
fibonacci <- function(nterms){
# first two terms
n1 = 0
n2 = 1
count = 2
# check if the number of terms is valid
if (nterms <= 0) {
print("Plese enter a positive integer")
} else {
if (nterms == 1) {
print("Fibonacci sequence:")
print(n1)
} else {
print("Fibonacci sequence:")
print(n1)
print(n2)
while (count < nterms) {
nth = n1 + n2
print(nth)
# update values
n1 = n2
n2 = nth
count = count + 1
}
}
}
}
fibonacci(10)

x = mtcars


########################################
#ggplot code

library("ggplot2")
ggplot(mtcars, aes(x=wt, y=mpg, color=mpg)) + geom_point()


#make sure there's a column for the car names in the dataframe
mtcars$carname=rownames(mtcars)
g1 = ggplot(mtcars)
print(g1)
g2 = g1 + aes(x=wt, y=mpg, color=mpg, label=carname)
print(g2)
g3 = g2 + geom_point(shape=16, size=5)
print(g3)
g4 = g3 + geom_text(color="black", size=2)
print(g4)
g5 = g4 + stat_density2d()
print(g5)
g6 = g5 + scale_x_reverse()
print(g6)
g7 = g6 + scale_color_gradient(low="red", high="blue")
print(g7)
g8 = g7 + xlab("weight") + ylab("miles per gallon") + ggtitle("scatterplot")
print(g8)
g9 = g8 + coord_cartesian( xlim = c(3,2), ylim = c(20, 25))
print(g9)



#play with some extra ggplot packages
library("ggthemes")
library("ggrepel")

g4 + facet_grid(am ~ gear)
g4 +facet_grid(gear ~ am)

g4 + theme_bw()
g4 + theme_wsj()

g3 + geom_text(color="black", size=4)
#now labels wont appear right on top of the points
g3 + geom_text_repel(color="black", size=4)





#this code won't work
#The first line is a valid statement, and R executes it immediately
ggplot(mtcars, aes(x=wt, y=mpg, color=mpg, label=carname))
  + geom_point(shape=16, size=5) 
  + geom_text(color="black", size=2) 

#this code will work 
#the first line is not a full statment,  R sees the + and expects more to come
ggplot(mtcars, aes(x=wt, y=mpg, color=mpg, label=carname)) +
  geom_point(shape=16, size=5) +
  geom_text(color="black", size=2) + 
  stat_density2d() + 
  scale_x_reverse() + 
  scale_color_gradient(low="blue", high="red") + 
  xlab("weight") + ylab("miles per gallon") + ggtitle("scatterplot") + 
  coord_cartesian( xlim = c(3,2), ylim = c(20, 25)) +
  theme()

 
#good
0 + 2 + 3 + 4 + 5

#bad
1 + 2
+ 3 + 4 + 5

#good
1 + 2 +
  3 + 4 + 5

#good
(1 + 2
  + 3 + 4 + 5)


#when you write your ggplot functions like this
#you can use a single comment to skip a line
#and it's a lot easier to build and test your code in layers
ggplot(mtcars, aes(x=wt, y=mpg, color=mpg, label=carname)) +
  geom_point(shape=16, size=5) +
  geom_text(color="black", size=2) + 
  stat_density2d() + 
  #scale_x_reverse() + 
  scale_color_gradient(low="blue", high="red") + 
  xlab("weight") + ylab("miles per gallon") + ggtitle("scatterplot") + 
  #coord_cartesian( xlim = c(3,2), ylim = c(20, 25)) +
  theme()

#the last line "theme()" does nothing, but it allows you keep a consistent format
#with the +'s always at the end of the line.  If you don't have theme()
#as the last line, you'll have to make sure your last command doesn't end in a +



######################################  
##magrittr

library("magrittr")


#define some simple functions
f <- function(x, p1){
  x + p1 
}

h <- function(x, p1=6, p2){
  x * p1 - p2
}

g <- . %>% sqrt


#call the functions

f(100, 2)
h(100,p2=4)
g(100)

#call the functions in a series
x = 1:10
x1 = f(x, 2)
x2 = h(x1, 6,4)
x3 = g(x2)
x3


#do it all in one line
g(h(f(x, 2), 6, 4))

#pipe it all in one line
x %>% f(p1=2) %>% h(p2=4) %>% g

#add 1 to the result using an anonymous function
x %>% f(p1=2) %>% h(p2=4) %>% g %>% {.+1}



#a complex chain of operations
data(mtcars)
car_data <- 
  mtcars %>%
  subset(hp > 100) %>%
  aggregate(. ~ cyl, data = ., FUN = . %>% mean %>% round(2)) %>%
  transform(kpl = mpg %>% multiply_by(0.4251)) %>%
  print

#break it down piece by piece to figure out what's going on
temp1 = mtcars %>% subset(hp > 100)
temp1
temp2 = temp1 %>% aggregate(. ~ cyl, data = ., FUN = . %>% mean %>% round(2))
temp2


