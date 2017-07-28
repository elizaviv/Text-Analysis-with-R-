#This are the first steps using R for scanning text in english and spanish.| Estos son los primeros pasos utilizando R para escanear textos en inglés y castellano.

setwd("~/Documents/TextAnalysisWithR") #sets working directory | establece el directorio de trabajo
rm(list = ls()) # Limpia en entorno | Cleans the environment

# Creates two vectors (text.en.v and text.sp.v) whit the lines from two texts obtained from Guttnberg project | Crea dos vectores (text.en.v y text.sp.v)con las líneas de dos textos obtenidos de internet 
# text.en.v is Moby Dick by H. Melvilly and text.sp.v is El Quijote by M. de Cervantes | text.en.v es Moby Dick de H. Melville y text.sp.v es El Quijote de M. de Cervantes
text.en.v <- scan ("http://www.gutenberg.org/files/2701/2701-0.txt", what="character", sep="\n")
text.sp.v <- scan ("http://www.gutenberg.org/files/2000/2000-8.txt", what="chararcter", sep="\n", encoding="latin1")
# Now we get two vectors one with 19200 lines and the other with 31932 lines | ahora tenemos dos vectores uno con 19200 líneas y el otro con 31932 líneas

# This is how to do this if you have the text in your computer: | Esto es cómo se haría esto mismo si tienes los archivos en tu ordenador: 
# text.v <- scan ("data/plainText/melville.txt", what="character", sep="\n") 
# text.v <- scan ("data/plainText/cervantes.txt", what="character", sep="\n") 

# For Moby Dick text read the text and find the first and last line and put it between the "" | Para el texto de Moby Dick lee y localiza la primera y última línea, y ponlas entre las "" 
start.en.v <- which (text.en.v == "CHAPTER 1. Loomings.") #Finds "CHAPTER 1. Loomings." which is the first line of the novel | encuentra "CHAPTER 1. Loomings." que es la primera línea de la novela
end.en.v <- which(text.en.v == "orphan.") #Finds "orphan." which is the last line of the novel | encuentra "orphan" que es la última línea de la novela

# For El Quijote text read the text and find the first and last line and put it between the "" | Para el texto de El Quijote lee y localiza la primera y última línea, y ponlas entre las "" 
start.sp.v <- which (text.sp.v == "Primera parte del ingenioso hidalgo don Quijote de la Mancha") #Finds "Primera parte del ingenioso hidalgo don Quijote de la Mancha" which is the first line of the novel | encuentra "Primera parte del ingenioso hidalgo don Quijote de la Mancha" que es la primera línea de la novela
end.sp.v <- which(text.sp.v == "Fin") #Finds "Fin" which is the last line of the novel | encuentra "Fin que es la última línea de la novela

#Length returns the number of lines of each novel |  Length devuelve el número de líneas de cada novela
length (text.en.v)
length (text.sp.v)

#For Moby Dick
#Shows first and last lines and the preceeding and following lines respectively | muestra las líneas primera y última y la anterior y siguiente respectivamente 
text.en.v[start.en.v]
text.en.v[start.en.v-1]
text.en.v[end.en.v]
text.en.v[end.en.v+1]

#For El Quijote
#Shows first and last lines and the preceeding and following lines respectively | muestra las líneas primera y última y la anterior y siguiente respectivamente 
text.sp.v[start.sp.v]
text.sp.v[start.sp.v-1]
text.sp.v[end.sp.v]
text.sp.v[end.sp.v+1]

#For Moby Dick 
#Now we get the novel lines without the start and end part | Ahora obtenemos las líneas de la novela sin las partes del comienzo y del final 
start.metadata.en.v <- text.en.v[1:start.en.v-1]# vector with start part | vector con la parte del comienzo
end.metadata.en.v <- text.en.v[end.en.v+1: length(text.en.v)]# vector with the end part | vector con la parte del final
metadata.en.v <- c(start.metadata.en.v, end.metadata.en.v)#new vector (c combine) with both start and end parts | nuevo vector con las partes de comienzo y final
novel.lines.en.v <- text.en.v[start.en.v:end.en.v]#new vector with the history | nuevo vector con la historia

#For El Quijote
#Now we get the novel lines without the start and end part | Ahora obtenemos las líneas de la novela sin las partes del comienzo y del final 
start.metadata.sp.v<- text.sp.v[1:start.sp.v-1]# vector with start part | vector con la parte del comienzo
end.metadata.sp.v <- text.sp.v[end.sp.v+1: length(text.sp.v)]# vector with the end part | vector con la parte del final
metadata.sp.v <- c(start.metadata.sp.v, end.metadata.sp.v)#new vector (c combine) with both start and end parts | nuevo vector con las partes de comienzo y final
novel.lines.sp.v <- text.sp.v[start.sp.v:end.sp.v]#new vector with the history | nuevo vector con la historia

#For Moby Dick
#Counting total text and novel lines without start and end lines | contando las líneas del texto en total y las de la novela sin las del comienzo y final
length(text.en.v)
length(novel.lines.en.v)
length(text.en.v)-length(novel.lines.en.v)

#For El Quijote
#Counting total text and novel lines without start and end lines | contando las líneas del texto en total y las de la novela sin las del comienzo y final
length(text.sp.v)
length(novel.lines.sp.v)
length(text.sp.v)-length(novel.lines.sp.v)

#Collapsing line for each novel | Juntando todas las líneas de cada novela
novel.en.v <- paste(novel.lines.en.v, collapse=" ")
novel.sp.v <- paste(novel.lines.sp.v, collapse=" ")

#Now we have a vector with only one element for each novel | ahora tenemos un vector con un único elemento para cada novela
length(novel.en.v)
length(novel.sp.v)
novel.en.v[1]
novel.sp.v[1]

#Putting put to lower case all the text in each novel | Poniendo en minúsculas todo el texto de cada novela
novel.lower.en.v <- tolower(novel.en.v)
novel.lower.sp.v <- tolower(novel.sp.v)

#Creating a list with only the words in each novel | Creando una lista de las palabras en cada novela
novel.words.en.l <-strsplit(novel.lower.en.v, "\\W") 
novel.words.sp.l <-strsplit(novel.lower.sp.v, "\\W") 

#Class returns the kind of structure of a variable | Class devuelve el tipo de estructura de una variable
class(novel.lower.en.v)
class(novel.words.en.l) 
class(novel.lower.sp.v)
class(novel.words.sp.l) 

#str returns the same as class but with more detail and the first item | str devuelve lo mismo que class pero con más detalle y te muestra el primer item
str(novel.lower.en.v)
str(novel.words.en.l)
str(novel.lower.sp.v)
str(novel.words.sp.l)

#unlist convierte una lista en un vector | unlist convierte una lista en un vector
novel.word.en.v <- unlist(novel.words.en.l)
novel.word.sp.v <- unlist(novel.words.sp.l)

#class y str for the new vector of words for each novel | class y str para el nuevo vector de palabras de cada novela
class(novel.word.en.v)
str(novel.word.en.v)
class(novel.word.sp.v)
str(novel.word.sp.v)

#Creating a vector with the positions of significant words (not blanks) for each novel | creating a vector con las posiciones de palabras de verdad (no blancos) para cada novela
not.blanks.en.v <- which(novel.word.en.v!="")
not.blanks.sp.v <- which(novel.word.sp.v!="")

#Overwrite word vector only with words, that is without blanks for each novel| sobreescribir el vector de palabras solo con palabras, es decir, sin blancos para cada novela
novel.word.en.v <- novel.word.en.v[not.blanks.en.v]
novel.word.en.v
novel.word.sp.v <- novel.word.sp.v[not.blanks.sp.v]
novel.word.sp.v
#We can also do the same this way:  moby.word.v <- moby.word.v[which(moby.word.v != "")] | Se puede hacer lo mismo de esta forma: moby.word.v <- moby.word.v[which(moby.word.v != "")] 

#Exercises with vectors |Ejercicios con vectores y posiciones 
mypositions.v <-c(4,5,6)
novel.word.en.v[mypositions.v]
novel.word.en.v[c(4,5,6)]

mypositions.v <-c(4,5,6)
novel.word.sp.v[mypositions.v]
novel.word.sp.v[c(4,5,6)]

#Finding a word | Encontrando una palabra
which(novel.word.en.v=="whale")
novel.word.en.v[which(novel.word.en.v=="whale")]

which(novel.word.sp.v=="merced")
novel.word.sp.v[which(novel.word.sp.v=="merced")]

length(novel.word.en.v[which(novel.word.en.v=="whale")])
length(novel.word.sp.v[which(novel.word.sp.v=="merced")])

#Put a count of the occurrences of whale into whale.hits.v | contar las veces que escribe una determinada palabra 
whale.hits.v <- length(novel.word.en.v[which(novel.word.en.v=="whale")])
merced.hits.v <- length(novel.word.sp.v[which(novel.word.sp.v=="merced")])

#Put a count of total words into total.words.en.v | contar el total de palabras y ponerlo en total.words.sp.v
total.words.en.v <-length(novel.word.en.v)
total.words.sp.v <-length(novel.word.sp.v)

#now divide | dividir
whale.hits.v/total.words.en.v
merced.hits.v/total.words.sp.v


#calculate the number of unique word types in each novel | calcular el número de palabras únicas en cada novela
length(unique(novel.word.en.v)) #Moby Dick
length(unique(novel.word.sp.v)) #El Quijote

#Put how often uses each word in a table | Poner en una tabla cuanto se usa cada palabra
novel.freqs.en.t <- table (novel.word.en.v)
novel.freqs.en.t[1:20]
novel.freqs.sp.t <- table (novel.word.sp.v)
novel.freqs.sp.t[1:20]

#sort frecuency tables | ordenar las tablas de frecuencias
sorted.novel.freqs.en.t <- sort(novel.freqs.en.t , decreasing = TRUE)
sorted.novel.freqs.en.t[1:10]
sorted.novel.freqs.sp.t <- sort(novel.freqs.sp.t , decreasing = TRUE)
sorted.novel.freqs.sp.t[1:10]

#get the top 10 used words and its frequencies | obtener las 10 palabras más frecuentes y sus frecuencias
topten.novel.freqs.en.t <- sorted.novel.freqs.en.t[1:10]
topten.novel.freqs.en.t
topten.novel.freqs.sp.t <- sorted.novel.freqs.sp.t[1:10]
topten.novel.freqs.sp.t

#Plot it | Dibujarlo
plot(topten.novel.freqs.en.t)
plot(topten.novel.freqs.sp.t)

############################### WORD FREQ | FRECUENCIA DE LAS PALABRAS ######################

# In the table sorted.novel.freqs.en.t | En la tabla sorted.novel.freqs.sp.t 
#the words are the index and the values are the frequencies | las palabras son los índices y los valores las frecuencias

sorted.novel.freqs.en.t["he"]
sorted.novel.freqs.en.t["she"]
sorted.novel.freqs.en.t["him"]
sorted.novel.freqs.en.t["her"]

sorted.novel.freqs.sp.t["él"]
sorted.novel.freqs.sp.t["ella"]
sorted.novel.freqs.sp.t["suyo"]
sorted.novel.freqs.sp.t["suya"]

#the most frequent word | la palabra más repetida
sorted.novel.freqs.en.t[1]
sorted.novel.freqs.sp.t[1]

#how much frequent is he/him than she/her 
sorted.novel.freqs.en.t["him"]/sorted.novel.freqs.en.t["her"]
sorted.novel.freqs.en.t["he"]/sorted.novel.freqs.en.t["she"]

#cuanto más frecuente es el que ella 
sorted.novel.freqs.sp.t["él"]/sorted.novel.freqs.sp.t["ella"]
sorted.novel.freqs.sp.t["suyo"]/sorted.novel.freqs.sp.t["suya"]

length(novel.word.en.v)#counts the words | cuenta las palabras
length(novel.word.sp.v)#counts the words | cuenta las palabras

#adding freqs gives the same result than length | sumar las frecuencias da el mismo resultado que contar las palabras
sum(sorted.novel.freqs.en.t)
sum(sorted.novel.freqs.sp.t)

#Convert the freq row to relative freqs | convierte las filas de frecuencias en frecuencias relativas (en porcentaje)
sorted.novel.rel.freqs.en.t <- 100*(sorted.novel.freqs.en.t/sum(sorted.novel.freqs.en.t))
sorted.novel.rel.freqs.sp.t <- 100*(sorted.novel.freqs.sp.t/sum(sorted.novel.freqs.sp.t))

#The relative freq of the most frequent word | la frecuencia relativa de la palabra más frecuente
sorted.novel.rel.freqs.en.t["the"]
sorted.novel.rel.freqs.sp.t["que"]

#Plot the relative freq of most frequent words in Moby Dick | Dibuja las frecuencias de las 10 palabras más frecuentes de Moby Dick
plot (sorted.novel.rel.freqs.en.t[1:10], type="b", xlab="Top ten words", ylab="Percentage of Full Text", xaxt="n")
axis(1, 1:10, labels=names(sorted.novel.rel.freqs.en.t[1:10]))
#Plot the relative freq of most frequent words in El Quijote | Diguja las frecuencias de las 10 palabras más frecuentes en El Quijote
plot (sorted.novel.rel.freqs.sp.t[1:10], type="b", xlab="Top ten words", ylab="Percentage of Full Text", xaxt="n")
axis(1, 1:10, labels=names(sorted.novel.rel.freqs.sp.t[1:10]))

