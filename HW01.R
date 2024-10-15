
bonds<-read.csv('Homework1_Bonds.csv')

# Total number of carried and defeated votes
table(bonds$Result)
# Proportions of carried and defeated votes for the types of government
prop.table(table(bonds$Type, bonds$Result), 2)

# New variable that is the sum of votes against and for
bonds$Votes_Total<-bonds$VotesAgainst + bonds$VotesFor
bonds[bonds$Votes_Total== max(bonds$Votes_Total),]

# New subset of data of approved bonds with at least 100 voters
approved<-bonds[bonds$Result =='Carried'& bonds$VotesFor>=100,]
# Graph of percentages of total votes for bond and description 
approved$Percentages<-approved$VotesFor/approved$Votes_Total
hist(approved$Percentages, main='Percentages of Approval for Bonds',xlab='Percentages',ylab='Frequency',col ='#7AC5CD' ,xlim=c(0.4,1.25),ylim=c(0,700))
fivenum(approved$Percentages)


# Approved bonds relationship with cost in graph
plot(approved$Percentages,approved$Amount, main='Approved Bonds and Cost',xlab='Margin of Approval',ylab='Cost',pch=20)
cor(approved$Percentages,approved$Amount)
