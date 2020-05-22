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
dim(muestra41)    #273032      4
colnames(muestra41) <- c("nif", "nombre", "genero")


#cambios de genero
muestra41$genero_imput <- NA
for( p in 1 : 273032 ) {
  ifelse( sum( muestra41$nombre == muestra41$nombre[p] & muestra41$genero == "M" ) > sum( muestra41$nombre == muestra41$nombre[p] & muestra41$genero == "V" ), 
         muestra41$genero_imput[p] <- "M", muestra41$genero_imput[p] <- "V" )
}#elimino todas las filas que no coincidan con ningun nombre y que no tengan genero asignado

#cambiamos y corregimos los nif que esten mal
regexp <- "([[:digit:]]{8})([[:alpha:]]{1})"
muestra41$nif_correccion <- grepl(pattern=regexp,x=muestra41$nif)
muestra41 <- muestra41%>%
  filter(nif_correccion==T)



