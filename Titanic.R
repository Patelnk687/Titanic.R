# titanic data was only available in datacamp so to get the entire data I used print(titanic) then copied 
#and pasted it on an excel file and split it then as this
install.packages("dplR")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)

setwd("C:/Users/NP/Desktop/SPRINGBOARD/Titanic")

# this step was cool I imported my data into R and it had an amazing optino to seperate (Delimiter) by whitespace 
#this imported my data not just in one column but in seperate columns and now I can work with it
library(readr)
titanic <- read_table2("titanic.csv")
View(titanic)
# 1 - Check the structure of titanic
str(titanic)
summary(titanic)


# 2 - Use ggplot() for the first instruction
ggplot(titanic, aes(x = Pclass, fill = Sex)) +geom_bar(position="dodge" )


##personal mission can I replicate the above plot using qplot?? I think it worked
qplot(x=Pclass, fill=factor(Sex), data= titanic,  binwidth=0) +geom_bar(position="dodge")


#I added a title with the movie spoiler that relates to this chart, well we can also say Leo dies and more men died but Leo dies and every movie. LOL.
ggplot(titanic, aes(x = Pclass, fill = Sex,title=("The barplot shows that more women survived than men.So yeah maybe Kate Winslet did survive"))) + geom_bar(position="dodge" )+facet_grid(. ~ Survived)


#I used filter to see how many data points were women and were able to survive then did the same for male and survived data
female<-filter(titanic,Sex=="female" & Survived==1)
summary(female)
count(female) #197 were female who luckily survived the titanic crash

male<-filter(titanic,Sex=="male" & Survived==1)
summary(male)
count(male) # 93 were male who luckily survived the titanic crash


print("The titanic was a tragedy but as the movie shows Kate Winslet's character had a higher chance or survival compared to Leo. Because 197 number of women survived. While only 93 number of males survived.")



# 4 - Define an object for position jitterdodge, to use below
posn.jd <- position_jitterdodge(0.5, 0, 0.6)

# 5 - I added a trend line  through geom_smooth which shows that out of the survived there were more female who were older that survived in class 1 and as the classes incresed the average age of women survivers decreased
ggplot(titanic, aes(x = Pclass,y=Age, color = Sex))+geom_smooth() +
  geom_point(size=3,alpha=0.5,position=posn.jd )+facet_grid(. ~ Survived)

summary(titanic$Age) # shows the mean age was 29.70 while the smallest passenger was 0.42 yrs while the oldest was 80 years old. 
male<-filter(titanic,Sex=="male")
summary(male) # this proves that the oldest and youngest were both male passengers 
summary(filter(titanic,Sex=="male" & Survived==1)) ## this proves that the oldest and youngest were both male passengers and they both survived
