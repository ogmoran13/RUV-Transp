#Promedio
Entidad<- transform(REGISTRO_RUV_5_2019, Estado = substr(CV_MUNICIPIO, 1, 2))
Mp<-(Entidad[c(3,34,43,44,45,46,54)])
#Preparación BD
MpVF<-Mp %>% 
  mutate(FH_PAGO_REGISTRO = ymd(FH_PAGO_REGISTRO)) %>% 
  mutate_at(vars(FH_PAGO_REGISTRO), list(year, month, day))
#Promedios Nacionales 
MpXLM<- MpVF %>% 
  filter(fn1== 2019 & fn2==5)%>%
  mutate(Rangos = cut(IM_PRECIO_VIVIENDA, c(0, 303083,513700,898975,1926375,3852750, Inf),dig.lab = 7)) %>% 
  group_by(fn1,fn2,Rangos)%>%
  summarise (Mean=mean(CT_SPR_TERRENO,na.rm = TRUE))
write.xlsx(as.data.frame(MpXLM), "C:/Users/IN335375/Documents/GPE/RUV/Mayo2019/CountEdo.xlsx")

#Promedios Estales
MpXLM<- MpVF %>% 
   mutate(Rangos = cut(IM_PRECIO_VIVIENDA, c(0, 303083,513700,898975,1926375,3852750, Inf),dig.lab = 7)) %>% 
   filter(fn1== 2019 & fn2==5)%>%
  group_by(fn1,fn2,Rangos,Estado)%>%
  summarise (Mean=mean(CT_SPR_TERRENO,na.rm = TRUE))
write.xlsx(as.data.frame(MpXLM), "C:/Users/IN335375/Documents/GPE/RUV/Mayo2019/CountEdo.xlsx")

#Valor Nacional
MpXLM<- MpVF %>% 
  filter(fn1== 2019 & fn2==5)%>%
  group_by(fn1,fn2)%>%
  summarise (Mean=mean(CT_SPR_TERRENO,na.rm = TRUE))

#Valor Estado
MpXLM<- MpVF %>% 
  filter(fn1== 2019 & fn2==5)%>%
  group_by(fn1,fn2,Estado)%>%
  summarise (Mean=mean(CT_SPR_TERRENO,na.rm = TRUE))

#Localizar valores
show<-Entidad[Entidad$IM_PRECIO_VIVIENDA == "5000000" & Entidad$Estado == "05", ]
