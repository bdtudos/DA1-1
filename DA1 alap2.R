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
##factors: kategórikus változókat valahogy eltárolja másképp. Ettől megszabadulvni:
df <- read.csv ('http://bit.ly/CEU-R-hotels-2017', stringsAsFactors = FALSE)
str (df)
##TODO: price -> plot, summary, frequency table
hotels <- df
plot (hotels$price_huf)
min (hotels$price_HUF)
max (hotels$price_HUF)
plot (hotels$price_HUF, min = 5000, max = 500000)
hist (hotels$price_HUF)
boxplot (hotels$price_HUF)
summary (hotels$price_HUF)
table (hotels$price_HUF)
barplot (table(hotels$price_HUF))
table (hotels$city)
## in order to create meaningful frequency table:
table (cut(hotels$price_HUF, breaks = 10))
plot (table (cut(hotels$price_HUF, breaks = 10)))
dotchart (table (cut(hotels$price_HUF, breaks = 10)))

plot (table (cut(hotels$price_HUF, breaks = 50, dig.lab = 8)))   #number number instead of exp number format
table (cut(hotels$price_HUF, breaks = 50, dig.lab = 8))

hotels$price_huf_cat <- cut (hotels$price_HUF, breaks = 20, dig.lab = 8)
tab_price_HUF_cat <- table(hotels$price_huf_cat)
dotchart(tab_price_HUF_cat)

which.max (hotels$price_HUF)
hotels [which.max(hotels$price_HUF),]   #max priced hotel
hotels [which.max(hotels$price_HUF),'hotel_name']   #max priced hotel name   

##TODO: cheapest
hotels [which.min(hotels$price_HUF),]   #max priced hotel

#all places where we are payin more than 100,000 HUF
hotels [hotels$price_HUF > 100000,]   #TRUE or FALSE for all hotels       
pricey = hotels [hotels$price_HUF > 100000,]   #TRUE or FALSE for all hotels
str (pricey)
table (pricey$city)


##másik módja 
which (hotels$price_HUF > 100000)
## hotels with price >100000 and rating < 3

hotels[which (hotels$price_HUF > 100000 & hotels$rating < 3),]
## másik módja ugyanennek
pricey <- hotels [hotels$price_HUF > 100000,]
pricey
pricey [which(pricey$rating < 3), ]   #kell a which, mert pricey egy csomó helyen NA-t tartalmaz



##egy jobb módszer mindenre
install.packages ('data.table')
library (data.table)
hotels <- data.table (hotels)
str (hotels)
##whatever you can do with tdata frame, you can do with data table too
##here you don't have to add extra , to get the row:
hotels [1]
##also simpler structure for search
hotels [price_HUF > 100000]
hotels [price_HUF > 100000 & rating < 3]

##TODO filter price <10000 and rating > 4
hotels [price_HUF < 10000 & rating > 4]
##OĐO: list the cities of those above
hotels [price_HUF < 10000 & rating > 4,2]
hotels [price_HUF < 10000 & rating > 4,'city']
hotels [price_HUF < 10000 & rating > 4,city]   #itt R kiértékeli a city változót. city itt a "city" oszlop vektort jelenti
hotels [price_HUF < 10000 & rating > 4,length (city)]   #itt R kiértékeli a city változót. city itt a "city" oszlop vektort jelenti
length (hotels [price_HUF < 10000 & rating > 4,city])
hotels [price_HUF < 10000 & rating > 4,unique(city)]   
## a fentiekben először kiértékeli az első kifejezést, és ami a filter-ben benne marad, az lesz csak a city-ben, nem az eredeti tábla összes city-je
hotels [price_HUF < 10000 & rating > 4,.N]      #R function to give the number of rows after filter
hotels [price_HUF < 10000 & rating > 4,mean(stars)]   
hotels [price_HUF < 10000 & rating > 4,mean(stars,na.rm = TRUE)]   #remove missing values   
hotels [price_HUF < 10000 & rating > 4,median(stars,na.rm = TRUE)]   #remove missing values   
hotels [price_HUF < 10000 & rating > 4,table(stars)]   


##SQL -> SELECT, UPDATE,...
##dt [i, j, by = ]
hotels[price_HUF > 250000, mean (stars, na.rm = TRUE), by = city]
hotels[price_HUF > 250000, city == 'Naples, Italy']
##TODO: average price per number of starts of all places
hotels [,mean(price_HUF, na.rm=TRUE), by = stars]
##it is not too nice, as not ordered, nor have a decent column name
hotels [, list(avg_price=mean(price_HUF, na.rm=TRUE)), by = stars]
hotels [, .(avg_price=mean(price_HUF, na.rm=TRUE)), by = stars]   # "." = "list"
price_per_stars = hotels [, list(avg_price=mean(price_HUF, na.rm=TRUE)), by = stars]
price_per_stars
setorder (price_per_stars, stars)
price_per_stars
setorder (price_per_stars, -stars) #reverse ordering
price_per_stars


## 
hotels [, list(
               avg_price=mean(price_HUF, na.rm=TRUE))
        , by = city]
hotels [, list(
              avg_price=mean(price_HUF, na.rm=TRUE),
              avg_stars = mean (stars, na.rm = TRUE),
              .N,
              with5Stars = sum (stars ==5))
  , by = city]
