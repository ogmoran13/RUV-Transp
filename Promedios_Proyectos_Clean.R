#Promedio
Entidad<- transform(REGISTRO_RUV_5_2019, Estado = substr(CV_MUNICIPIO, 1, 2))
Mp<-(Entidad[c(11,3,34,43,44,45,46,54)])
#Preparación BD
MpVF<-Mp %>% 
  mutate(FH_PAGO_REGISTRO = ymd(FH_PAGO_REGISTRO)) %>% 
  mutate_at(vars(FH_PAGO_REGISTRO), list(year, month, day))
#Promedios Nacionales 
MpXLM<- MpVF %>% 
  filter(fn1== 2019 & fn2==5)%>%
  group_by(fn1,fn2,Estado)%>%
  count(CV_OFERTA)
write.xlsx(as.data.frame(MpXLM), "C:/Users/IN335375/Documents/GPE/RUV/Mayo2019/Proyecto.xlsx")
