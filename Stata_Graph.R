install.packages("ggthemes")
library(ggplot2)
library(ggthemes)

p <- ggplot(Datos_R, aes(x= Datos_R$Nivel_Personal, y= Datos_R$Calificacion))+ geom_point()+
  ggtitle("Calificaci�n del personal") +
  xlab("Nivel del personal") + ylab("Calificaci�n")
p + theme_stata() + scale_color_stata() + ggtitle("Calificaci�n del personal")