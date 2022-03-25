

if(!require("seqinr")){
  install.packages("seqinr", dependencies = TRUE)
  library("seqinr")
}

path <- "//srvnas/svs/CGLAB/1200_Genomas_piloto/analises/MG/2022-01-20"
dataConsensus <- "2022-01-20"
setwd(path)

myFasta <- read.fasta(paste0("2022-01-20_consensus.fasta"), forceDNAtolower = FALSE)
myFile <- read.table(paste0("2022-01-20_renomear.txt"), header = TRUE, sep = "\t")

newName <- c()
newFasta <- list()
#identifica o nome da sequência no cabeçalho e remove informação desnecessária
###Importante: colocar a informação a ser removida no parametro do meio###
fileNames <- str_replace_all(names(myFasta), "_nt-alignment", "")
for(i in 1:nrow(myFile)){
  #verifica a posiçao da lista que o nome se encontra
  pos <- which(fileNames == myFile$barcode[i])
  if (!(identical(pos, integer(0)))){
    #renomeia
    newName[i] <- myFile$name[i]
    newFasta[[i]] <- myFasta[[pos]]
  }
}

write.fasta(sequences = newFasta, names = newName, file.out = paste0(dataConsensus, "_consensus_final.fasta"))
