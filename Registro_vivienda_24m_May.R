# Registro de vivienda 24 m
TranViv<-(REGISTRO_RUV_5_2019[c(1,6,4,17,20,34,35,36,37,38,39,40,41,42)])
#Total
TranVivXLM<- TranViv %>% 
  filter((IN_CLASIFICADO== 1 ))%>% 
  group_by(CV_NODO,CV_MUNICIPIO)%>%
  count()
write.xlsx(as.data.frame(TranVivXLM), "C:/Users/IN335375/Documents/GPE/RUV/Mayo2019/TranViv.xlsx")
#Nueva
TranVivXLM<- TranViv %>% 
  filter((IN_CLASIFICADO== 1 & IN_OFERTA_NUEVA== 1 ))%>% 
  group_by(CV_NODO,CV_MUNICIPIO)%>%
  count()
write.xlsx(as.data.frame(TranVivXLM), "C:/Users/IN335375/Documents/GPE/RUV/Mayo2019/TranVivNueva.xlsx")
#Usada
TranVivXLM<- TranViv %>% 
  filter((IN_CLASIFICADO== 1 & IN_OFERTA_NUEVA== 0 ))%>% 
  group_by(CV_NODO,CV_MUNICIPIO)%>%
  count()
write.xlsx(as.data.frame(TranVivXLM), "C:/Users/IN335375/Documents/GPE/RUV/Mayo2019/TranVivUsada.xlsx")
