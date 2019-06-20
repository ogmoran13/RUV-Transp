install.packages("ggthemes")
library(ggplot2)
library(ggthemes)

p <- ggplot(Datos_R, aes(x= Datos_R$Nivel_Personal, y= Datos_R$Calificacion))+ geom_point()+
  ggtitle("Calificación del personal") +
  xlab("Nivel del personal") + ylab("Calificación")
p + theme_stata() + scale_color_stata() + ggtitle("Calificación del personal")
