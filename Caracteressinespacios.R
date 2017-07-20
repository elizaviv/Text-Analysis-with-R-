#Get the number of characters without blanks of a given txt | Calcula el número de caracteres sin espacios de un texto dado
#This is used to calculate the price of a translation based on the characters not blanks of a text

setwd("~/Documents/TextAnalysisWithR") #sets working directory | establece el directorio de trabajo
rm(list = ls()) # Limpia en entorno | Cleans the environment

#load in a vector the lines of a text
text.v <- scan ("data/palabras1.txt", what="character", sep="\n") # carga un vector con las líneas de un txt que está archivado

number.rows <- length (text.v)#returns number of rows de text.v | devuelve el número de filas de text.v
#number.rows

#Removes blank lines | elimina lineas en blanco
collapsed.v <- paste(text.v, collapse=" ")
#length(collapsed.v)
#collapsed.v[1]

#Get the list of all words and puntuation characters | saca en una lista todos las palabras y caracteres de puntuación
text.l <-strsplit(collapsed.v, "\\s")
#text.l

#Convert the list in a vector | convierte la lista en un vector
tex.v <- unlist(text.l)
#text.v

#Creates a new vector with the positions of the not blanks characters | crea un vector con las posiciones de los caracteres no blancos 
not.blanks.v <- which(text.v!="")

#Creates a vector with the words and characters that aren't blanks | crea un vector con las palabras y caracteres que no son blancos
text1.v <- text.v[not.blanks.v]
#text1.v

#Creates a vector text1.v in a vector with all the text | crea un vector text1.v con todo el texto
collapsed.text1.v <- paste(text1.v, collapse = "")
#collapsed.text1.v

#creates a list of all the text in text1.v | crea una lista con todo el texto en text1.v
character.l <- strsplit(collapsed.text1.v, split=0)
#character.l

#creates al vector with this list | crea un vector con esta lista
character.v <- unlist(character.l)
#character.v

#counts the characters not blanks in the vector | cuenta los caracteres no blancos en la lista
character.hits <- sum(nchar(gsub(" ","",character.v)))
character.hits

#Another form, more elegant, of doing this | otra forma, más elegante, de hacer esto
library (stringi)
stri_stats_general(character.v)

# Calculate the price of a translation at 13 € each 1500 characteres non blanks | calcular el precio de una traducción a 13 € cada 1500 caracteres sin espacios
Factura <- (character.hits /1500) *13
Factura



