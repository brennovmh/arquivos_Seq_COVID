library("ggplot2")

#Crianda dataset

Data <- "Jan 2022"   #Atributo com mês-ano de coleta
View(Data)

Quantidade <- c(1, 6) #Quantidade de amostras de cada linhagem
View(Quantidade)

Linhagens <- c("Delta", "Omicron") #Linhagens detectadas

proporcao <- c(0.16, 0.83) #Proporção das linhgens detectadas

cbind(Data, Quantidade, Linhagens, proporcao) -> results #Dataframefinal
View(results)

as.data.frame(results) -> results
View(results)

#Plot com ggplot 

ggplot(results, aes(fill = Linhagens, x = Data, y = proporcao)) +
  geom_bar(position = "stack", stat = "identity") + theme_classic() +
  ylab("Proporção das Linhagens\n") + xlab("Data de Coleta")+ 
  theme(text = element_text(size = 15)) +
  scale_fill_brewer(palette = "YlGnBu") -> graph

#Salvando gráfico no diretório atual 

ggsave(filename = "Gráfico CGLAB",
       plot = print(graph),
       device = png,
       scale = 1,
       dpi = 300,
       units = c("cm"))
