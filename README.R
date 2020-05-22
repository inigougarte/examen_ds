library(readxl)
library(ggplot2)
library(dplyr)
library(Hmisc)
library(caret)
library(mice)
library(e1071)
library(nortest)
library(ggplot2)
library(plotly)
library(dplyr)
library(gridExtra)
library(ggthemes)
library(csv)
library(xlsx)
library(randomForest)
library(lubridate)
library(tidyverse)
library(gapminder)
library(stringi)
library(fastDummies)
library(recommenderlab)
setwd('C:/Users/inigo/Desktop/EXAMEN_DS/Archivos_examen_ds')
load("muestra41.RData")
dim(muestra41)
colnames(muestra41) <- c("nif", "nombre", "genero")


#cambiamos y corregimos los nif que esten mal
regexp <- "([[:digit:]]{8})([[:alpha:]]{1})"
muestra41$nif_correccion <- grepl(pattern=regexp,x=muestra41$nif)
muestra41 <- muestra41%>%
  filter(nif_correccion==T)



