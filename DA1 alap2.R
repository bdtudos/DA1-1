h <- c (174,170,160)
w <- c (90, 80, 70)
cor (h ,w)
plot (h, w)


## create dataframes
df <- data.frame (weight = w, height = h)
df
str (df)
## df [rows, columns]
df [1,1]
df [1,]
df [, 1]

str (df)
df$weight
df$height
df$weight[1]

cor (df)
plot (df)

## TODO: Create BMI
## weight / (height) in meters on 2
df$BMI <- df$weight / (df$height / 100) ^2
df
summary (df$BMI)


##new data download from the internet
df <- read.csv ('http://bit.ly/CEU-R-heights')
str (df)
## TODO: compute BMI, create height in cm, weight in kg, then the BMI
df$heightcm <- df$heightIn * 2.54
df$weightkg <- df$weightLb * 0.45359237
df$BMI <- df$weightkg / (df$heightcm / 100) ^2
summary (df$BMI)
str (df)

min (df$BMI)
max (df$BMI)
range (df$BMI)
plot (df)
hist(df$BMI)
sum(df$weightkg)
lenght (df$BMI)
length(df$BMI)
dim(df)
nrow(df)
ncol(df)
## removing a column
df$weightkg <- NULL
dim(df)
str (df)

hist (df$BMI)
abline (v = c (18,25), col = 'red')
plot (density(df$BMI))
boxplot (df$BMI)
boxplot (BMI ~ sex,df)


## alternative boxplot
install.packages ('beanplot')
library (beanplot)
beanplot (df$BMI)
beanplot (BMI ~ sex, df)
?beanplot

##violin plot
pie (table(df$sex))   #table: creates frequency table, which is passed to pie
barplot (table(df$sex))   #table: creates frequency table, which is passed to bar
dotchart (table (df$sex), xlim = c(0,150))
pairs (df)   #very good for explonatory data analysis

install.packages ('GGally')
library (GGally)
ggpairs (df)   #very good for initial data exploration


##interactive data exploration
install.packages ('pairsD3')
library (pairsD3) #R -> JSON -> JS
pairsD3 (df)
## ezzel lehet pl olyant, hogy kijelöni egy grafikonon a male-t és nézni a többin hol vannak a pontjaik, vagy pl. az 50 évnél öregebbeket,...

## intro to stats: t-test
t.test (heightIn ~ sex, data = df) #ha a p-value 0.005-nél nagyobb, akkor nincs oka az eltéréseknek
df
str (df)
aov (heightIn ~ sex, data = df)
summary (aov (heightIn ~ sex, data = df))




## new dataset
df <- read.csv ('http://bit.ly/CEU-R-hotels-2017')
str (df)
summary (df)
dim (df)
