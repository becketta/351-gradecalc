
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')

  })

})
# 
# ######################################################################
# ###                                R grade calculation
# ###                created by  M. Huebner  2015-02-25
# ######################################################################
# 
# 
# #####################  ENTER YOUR POINTS    #########################
# ## Enter your grades (replace any missing with  NA or an estimated grade)
# ## Check to make sure you didn't have a typo, e.g. negative numbers or too large numbers, or too many/too few entries.
# 
# ## EXAMPLE
# hw<-c(NA,8,10,9,10,10,10,10,10);        # Rstudio homework points (9 assignments)
# online <-c(6,10,NA,6,10,12);                # six online homework  (Max points: data description=6, discrete RV=10,  Chap3 = 8, Normal prob=6, inference=10, regression =12)
# qz<-c(8,9,10,NA,10,10,10,10,10,10);    # quiz points (10 quizzes)
# e<-c(29,50,50,50)                                   # exam points (4 exams)
# 
# 
# 
# #####################  COPY/PASTE all code below   #########################
# 
# #####################  REPLACE MISSING WITH 0  
# 
# hw[is.na(hw)]<-0   
# online[is.na(online)]<-0   
# qz[is.na(qz)]<-0    
# 
# 
# #####################  POSSIBLE POINTS   
# 
# hwmax<-c(10,8,10,10,10,10,10,10,10)  # possible points per Rstudio assignement
# hwpts1<-10*(length(hwmax)-1)            # Rstudio hmw standardized to 10 each and lowest will be dropped
# online1 <- sum(c(6,10,8,6,10,12))         # total online hmw points
# qpts1<-80                                               # total best 8 of 10 quizzes
# epts1<-200                                             # 4 exams at 50 each
# 
# 
# ####################  CALCULATE GRADE   
# 
# # From syllabus
# cutoff<-c(0.499,0.549,0.629,0.699,0.759,0.829,0.899)   # grade cutoffs
# # From syllabus
# maxpts<-400;   # max course points
# maxhwpts<-120  # max homework points
# maxqpts<-80    # max quiz points
# maxepts<-200   # max exam points
# 
# 
# # From data entry and applying rules
# #quiz totals
# temp<-sort(qz)
# quiz<-sum(temp)-temp[1]-temp[2]  # drop lowest 2 of 10
# quiz<-as.numeric(quiz)
# quiz<-maxqpts*(quiz/qpts1)  #standardize sum of quiz scores to max possible points
# 
# # homework totals
# hw<-10*hw/hwmax   # standardize all Rstudio homework to  10 each
# temp<-sort(hw)
# hmw<-sum(temp)-temp[1]  # drop lowest
# hmw<-as.numeric(hmw)
# hmw<-maxhwpts*((hmw+sum(online))/(hwpts1+online1))    #standardize sum of homework points to max possible hmw points
# 
# exam<-sum(e)                 # sum of exam points
# 
# 
# # Course points and course percent
# pts<-quiz+hmw+exam   # These are the accumlated course points.
# pct<-pts/maxpts;            # This is the course percent.
# 
# # function to calculate the letter grade
# lettergrades<-function(cutoff, pct){
#   
#   grade<-0
#   grade<-ifelse(pct<cutoff[1],0,
#                 ifelse(pct<cutoff[2],1, 
#                        ifelse(pct<cutoff[3], 1.5,
#                               ifelse(pct<cutoff[4],2,
#                                      ifelse(pct<cutoff[5],2.5,
#                                             ifelse(pct<cutoff[6],3,
#                                                    ifelse(pct<cutoff[7],3.5,4)))))))
#   
#   grade
# }
# 
# xx<-lettergrades(cutoff,pct);   # This is the grade.
# paste("The course grade is ", xx)
# 
# 
# # Optional: Check your points in all assignments and overall grade 
# all<-c(hw,online,qz,e,pts,pct,xx);    
# names(all)<-c("h1", "h2", "h3", "h4", "h5", "h6", "h7", "h8", "h9", "online1", "online2", "online3", "online4", "online5", "online6",  "q1", "q2", "q3", "q4", "q5", "q6", "q7", "q8", "q9", "q10", "e1", "e2", "e3", "e4", "total", "percent", "grade")
# all
# 
