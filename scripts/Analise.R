# Nome: Matheus Nobre
# Objetivo: Criar gr�ficos com a planilha tratada

# Instalando e ativando as bibliotecas necess�rias
# install.packages('readxl')
# install.packages('ggplot2')
library('readxl')
library('ggplot2')

# Lendo o arquivo enviado pelo cliente
dataset = read_excel("PlanilhaTratada.xlsx")
dataset = dataset[2:8]

# Tratando o dataset principal
dataset$Data.In�cio = format(dataset$Data.In�cio, format = "%m/%Y")
dataset$Idade = strtoi(dataset$Idade)
dataset$Frequ�ncia = strtoi(dataset$Frequ�ncia)





# Criando o set para o PRIMEIRO gr�fico
grafico1 = unique(dataset[, c(4)])

# Tratando o gr�fico 1 para plotagem
count.Estado = c()

for (i in grafico1$Estado) {
  count.Estado = c(count.Estado, sum(dataset$Saldo.Real[dataset$Estado == i]))
}

grafico1 = data.frame(grafico1, count.Estado)

# 1� gr�fico: Estados x Saldo dos Usu�rios
ggplot(grafico1, aes(Estado, count.Estado)) + 
  geom_bar(stat= "identity") + 
  labs(x = "Estado", y = "Saldo") +
  ggtitle("Estados x Saldo dos Usu�rios")





# Criando o set para o SEGUNDO gr�fico
grafico2 = unique(dataset[, c(5)])


# Tratando o gr�fico 2 para plotagem
count.Frequencia = c()
for (i in grafico2$Idade) {
  count.Frequencia = c(count.Frequencia, mean(dataset$Frequ�ncia[dataset$Idade == i]))
}
grafico2 = data.frame(grafico2, count.Frequencia)

# 2� gr�fico: Idade x Frequencia
ggplot(grafico2, aes(Idade, count.Frequencia)) + 
  geom_bar(stat= "identity") + 
  labs(x = "Estado", y = "Frequ�ncia") +
  ggtitle("Idade x Frequencia")





# Criando o set para o TERCEIRO gr�fico
grafico3 = data.frame(Data = unique(dataset$Data.In�cio))

# Tratando o gr�fico 3 para plotagem
count.Cliente = c()
for (i in grafico3$Data) {
  count.Cliente = c(count.Cliente, length(dataset$Cliente[dataset$Data.In�cio == i]))
}
grafico3 = data.frame(grafico3, count.Cliente)

# 3� gr�fico: Cliente x Data
ggplot(grafico3, aes(Data, count.Cliente)) + 
  geom_bar(stat= "identity") + 
  labs(x = "data", y = "N�mero de clientes") +
  ggtitle("Cliente x Data")
