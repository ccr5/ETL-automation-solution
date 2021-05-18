# Nome: Matheus Nobre
# Objetivo: Automatização de pré-processamento de planilha

# Instalando e ativando as bibliotecas necessárias
# install.packages('readxl')
# install.packages('xlsx')
library('xlsx')
library('readxl')

# Lendo o arquivo enviado pelo cliente
dataset = read_excel("PlanilhaEnviada.xlsx")

# Criando um vetor com as colunas e a ordem da nova planilha
index = c("Data Início","Cliente", "E-mail", "Estado", "Idade", "Frequência")

# Criando o novo conjunto de dados para armazenar as informações necessárias
result = data.frame(index = c(1:length(dataset$Status)))

# Armazenando as informações necessárias
for (col_name in index) {
  for (i in names(dataset)) {
    if (col_name == i) {
      result = data.frame(result, dataset[i])
    }
  }
}

# Ajustando a coluna de classificação (frequência)
for (i in c(1:length(result$Frequência))) {
  if (result$Frequência[i] == "Muito pouco") {
    result$Frequência[i] = 1
  } else if (result$Frequência[i] == "Pouco") {
    result$Frequência[i] = 2
  } else if (result$Frequência[i] == "Regular") {
    result$Frequência[i] = 3
  } else if (result$Frequência[i] == "Frequente") {
    result$Frequência[i] = 4
  } else if (result$Frequência[i] == "Muito frequente") {
    result$Frequência[i] = 5
  }
}

# Criando coluna operacional
Saldo.Real = dataset$Saldo + dataset$Poupança + dataset$`Lim. Crédito` - 
  dataset$Empréstimo - dataset$Financiamentos

# Adicionando coluna operacional
result = data.frame(result, Saldo.Real)

# Removendo a coluna inicial
# Usada apenas para realizar os passos anteriores
result = result[2:8]

# Exportando para um novo arquivo Excel
write.xlsx(result, file = "C:/Users/matt-/Documents/Ampfy/PlanilhaTratada.xlsx")