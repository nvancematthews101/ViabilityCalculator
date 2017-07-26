
# Viability Calculator 

# Purpose: to compute the top viability deficiencies
# Algorithm developed by William Treseder of BMNT Partners
# Code implementation developed by Vance Matthews
# Date: July 26th 2017


# Load libraries, data and set the score for each question to 0
library(googlesheets)
library(gsheet)
library(reshape2)
library(knitr)
library(V8)

data <- gsheet2tbl('https://docs.google.com/spreadsheets/d/1_noc-xikccP62ZZFCt7FkHD3W8A1RQrSEDuG4EAZeyw/edit#gid=1319224023')
score = 150
fullScore = 150

q3 = 0
q4 = 0
q5 = 0
q7 = 0
q8 = 0
q10 = 0
q11 = 0
q12 = 0
q13 = 0
q14 = 0
q15 = 0 
q16 = 0
q17 = 0
q18 = 0
q19 = 0
q20 = 0
q21 = 0

# Problem Owner Score
ownerScore = 19;
fullOwnerScore = 19;
# Question 3
if(data[nrow(data),4] == 'No'){
  score = score - 4
  ownerScore = ownerScore - 4
  q3 = 4
}
# Question 4
if(data[nrow(data),5] == '< 6 months'){
  score = score - 15
  ownerScore = ownerScore - 15
  q4 = 15
}
if(data[nrow(data),5] == '6-12 months'){
  score = score - 5
  ownerScore = ownerScore - 5
  q4 = 5
}
if(data[nrow(data),5] == '12-24 months'){
  score = score - 3
  ownerScore = ownerScore - 3
  q4 = 3
}

# Senior Leader Score
seniorScore = 32
fullSeniorScore = 32
# Question 5
if(data[nrow(data),6] == 'No'){
  score = score - 16
  seniorScore = seniorScore - 16
  q5 = 16
}
# Question 7
if(data[nrow(data),8] == 'No'){
  score = score - 8
  seniorScore = seniorScore - 8
  q7 = 8
}
# Question 9
if(data[nrow(data),9] == '< 6 months'){
  score = score - 8
  seniorScore = seniorScore - 8
  q8 = 8
}
if(data[nrow(data),9] == '6-12 months'){
  score = score - 4
  seniorScore = seniorScore - 4
  q8 = 5
}
if(data[nrow(data),9] == '12-24 months'){
  score = score - 2
  seniorScore = seniorScore - 2
  q8 = 2
}

# Problem Score
problemScore = 49
fullProblemScore = 49
# Question 10
if(data[nrow(data),11] == 'No'){
  score = score - 6
  problemScore = problemScore - 6
  q10 = 6
}
# Question 11
if(data[nrow(data),12] == 'No'){
  score = score - 6
  problemScore = problemScore - 6
  q11 = 6
}
if(data[nrow(data),12] == 'Not directly'){
  score = score - 3
  problemScore = problemScore - 3
  q11 = 3
}
# Question 12
if(data[nrow(data),13] == 'No'){
  score = score - 6
  problemScore = problemScore - 6
  q12 = 6
}
# Question 13
if(data[nrow(data),14] == 'No'){
  score = score - 4
  problemScore = problemScore - 4
  q13 = 4
}
# Question 14
if(data[nrow(data),15] == 'Yes'){
  score = score - 6
  problemScore = problemScore - 6
  q14 = 6
}
# Question 15
if(data[nrow(data),16] == 'Yes'){
  score = score - 15
  problemScore = problemScore - 15
  q15 = 15
}
# Question 16
if(data[nrow(data),17] == 'Yes, competing'){
  score = score - 6
  problemScore = problemScore - 6
  q16 = 6 
}

# Viability Score
viabilityScore = 50
fullViabilityScore = 50
# Question 17
if(data[nrow(data),18] == "No"){
  score = score - 14
  viabilityScore = viabilityScore - 14
  q17 = 14
}
if(data[nrow(data),18] == "Not directly, new partner"){
  score = score - 8
  viabilityScore = viabilityScore - 8
  q17 = 8
}
if(data[nrow(data),18] == "Not directly, old partner"){
  score = score - 3
  problemScore = viabilityScore - 3
  q17 = 3
}
# Question 18
if(data[nrow(data),19] == "No"){
  score = score - 10
  viabilityScore = viabilityScore - 10
  q18 = 10
}
if(data[nrow(data),19] == "Not directly, new partner"){
  score = score - 6
  viabilityScore = viabilityScore - 6
  q18 = 6
}
if(data[nrow(data),19] == "Not directly, old partner"){
  score = score - 2
  problemScore = viabilityScore - 2
  q18 = 2
}
# Question 19
if(data[nrow(data),20] == "No"){
  score = score - 10
  viabilityScore = viabilityScore - 10
  q19 = 10
}
if(data[nrow(data),20] == "Not directly, new partner"){
  score = score - 6
  viabilityScore = viabilityScore - 6
  q19 = 6
}
if(data[nrow(data),20] == "Not directly, old partner"){
  score = score - 2
  problemScore = viabilityScore - 2
  q19 = 2
}
# Question 20
if(data[nrow(data),21] == "No"){
  score = score - 8
  viabilityScore = viabilityScore - 8
  q20 = 8
}
if(data[nrow(data),21] == "Not directly, new partner"){
  score = score - 5
  viabilityScore = viabilityScore - 5
  q20 = 5
}
if(data[nrow(data),21] == "Not directly, old partner"){
  score = score - 1
  problemScore = viabilityScore - 1
  q20 = 1
}
# Question 21
if(data[nrow(data),22] == "No"){
  score = score - 8
  viabilityScore = viabilityScore - 8
  q21 = 8
}
if(data[nrow(data),22] == "Not directly, new partner"){
  score = score - 5
  viabilityScore = viabilityScore - 5
  q21 = 5
}
if(data[nrow(data),22] == "Not directly, old partner"){
  score = score - 1
  problemScore = viabilityScore - 1
  q21 = 1
}

# Organize the question results into a df and assign the question numbers
questions.results <- data.frame(q3, q4, q5, q7, q8, q10, q11, q12, 
                      q13, q14, q15, q16, q17, q18, q19, q20, q21)
question.numbers <- c(3,4,5,7,8,10,11,12,13,14,15,16,17,18,19,20,21)
bound.questions <- rbind(questions.results, question.numbers)

# Order the questions by deficiencies
ordered.questions <- tail(sort(bound.questions[1,1:ncol(bound.questions)]))
ultrabound <- rbind(ordered.questions, bound.questions[2,])
deficiencies <- ultrabound[,ncol(ordered.questions):12] 
weakness <- colnames(data)[unlist(deficiencies[2,1:5])]

# Print out resulting score
cat(" Score: ", score, "\n",
    "Most significant deficiencies: \n", 
    "1.", weakness[1], "\n",
    "2.", weakness[2], "\n",
    "3.", weakness[3], "\n",
    "4.", weakness[4], "\n",
    "5.", weakness[5])

# If any outside program needs a vector of characters to be passed
charVector <- paste(" Score: ", score, "\n",
    "Most significant deficiencies: \n", 
    "1.", weakness[1], "\n",
    "2.", weakness[2], "\n",
    "3.", weakness[3], "\n",
    "4.", weakness[4], "\n",
    "5.", weakness[5])

charVector <- strsplit(step1, "\n")[[1]]



