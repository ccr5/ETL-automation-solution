# Nome: Matheus Nobre
# Objetivo: Criar gráficos com a planilha tratada

# Instalando e ativando as bibliotecas necessárias
# install.packages('readxl')
# install.packages('ggplot2')
library('readxl')
library('ggplot2')

# Lendo o arquivo enviado pelo cliente
dataset = read_excel("PlanilhaTratada.xlsx")
dataset = dataset[2:8]

# Tratando o dataset principal
dataset$Data.Início = format(dataset$Data.Início, format = "%m/%Y")
dataset$Idade = strtoi(dataset$Idade)
dataset$Frequência = strtoi(dataset$Frequência)





# Criando o set para o PRIMEIRO gráfico
grafico1 = unique(dataset[, c(4)])

# Tratando o gráfico 1 para plotagem
count.Estado = c()

for (i in grafico1$Estado) {
  count.Estado = c(count.Estado, sum(dataset$Saldo.Real[dataset$Estado == i]))
}

grafico1 = data.frame(grafico1, count.Estado)

# 1º gráfico: Estados x Saldo dos Usuários
ggplot(grafico1, aes(Estado, count.Estado)) + 
  geom_bar(stat= "identity") + 
  labs(x = "Estado", y = "Saldo") +
  ggtitle("Estados x Saldo dos Usuários")





# Criando o set para o SEGUNDO gráfico
grafico2 = unique(dataset[, c(5)])


# Tratando o gráfico 2 para plotagem
count.Frequencia = c()
for (i in grafico2$Idade) {
  count.Frequencia = c(count.Frequencia, mean(dataset$Frequência[dataset$Idade == i]))
}
grafico2 = data.frame(grafico2, count.Frequencia)

# 2º gráfico: Idade x Frequencia
ggplot(grafico2, aes(Idade, count.Frequencia)) + 
  geom_bar(stat= "identity") + 
  labs(x = "Estado", y = "Frequência") +
  ggtitle("Idade x Frequencia")





# Criando o set para o TERCEIRO gráfico
grafico3 = data.frame(Data = unique(dataset$Data.Início))

# Tratando o gráfico 3 para plotagem
count.Cliente = c()
for (i in grafico3$Data) {
  count.Cliente = c(count.Cliente, length(dataset$Cliente[dataset$Data.Início == i]))
}
grafico3 = data.frame(grafico3, count.Cliente)

# 3º gráfico: Cliente x Data
ggplot(grafico3, aes(Data, count.Cliente)) + 
  geom_bar(stat= "identity") + 
  labs(x = "data", y = "Número de clientes") +
  ggtitle("Cliente x Data")
