select distinct s.CLIENTE_ID_MICROSIP, s.NOMBRE_CLIENTE from SERIES_VENDIDOS_PRI_TODOS s where s.CLIENTE_ID_MICROSIP is null order by s.NOMBRE_CLIENTE;
select count(*) from SERIES_VENDIDOS_PRI_TODOS s where s.CLIENTE_ID_MICROSIP is null ;


update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ADALBERTO CHAVEZ GARC%') 
where s.NOMBRE_CLIENTE = 'ADALBERTO CHAVEZ GARC═A';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ADOLFO MUÑOZ CAMACHO%') 
where s.NOMBRE_CLIENTE = 'ADOLFO MUÐOZ CAMACHO';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%AGUSTIN HERNANDEZ%') 
where s.NOMBRE_CLIENTE = 'AGUSTIN HERN┴NDEZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ALFONSINA VILLAFA%') 
where s.NOMBRE_CLIENTE = 'ALFONSINA VILLAFAÐA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ALFONSO MONTAÑO RAMOS%') 
where s.NOMBRE_CLIENTE = 'ALFONSO MONTAÐO RAMOS';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ALFONSO PEREZ SEGURA%') 
where s.NOMBRE_CLIENTE = 'ALFONSO P╔REZ SEGURA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ALFREDO GADSDEN CARRASCO%') 
where s.NOMBRE_CLIENTE = 'ALFREDO GADSDEN CARRASCO GADSDEN CARRASCO';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ALICIA MARTINEZ DEL%') 
where s.NOMBRE_CLIENTE = 'ALICIA MART═NEZ DEL CAMPO MART═NEZ DEL CAMPO';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%AMADA DOMINGUEZ%') 
where s.NOMBRE_CLIENTE = 'AMADA DOM═NGUEZ DE SCHOCH';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%AMALIA MUSI%') 
where s.NOMBRE_CLIENTE = 'AMALIA MUSIÐO GONZ┴LEZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%AMELIA AVIÑA%') 
where s.NOMBRE_CLIENTE = 'AMELIA AVIÐA HURTADO';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%AMPARO L%') 
where s.NOMBRE_CLIENTE = 'AMPARO LËPEZ ALCANTUR';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ANA LILIA BAEZ CASTA%') 
where s.NOMBRE_CLIENTE = 'ANA LILIA BAEZ CASTAÐEDA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ANA MARIA  ALFARO%') 
where s.NOMBRE_CLIENTE = 'ANA MARIA ALFARO ESPEJO';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ANA MARIA DEL CARMEN BLANCO%') 
where s.NOMBRE_CLIENTE = 'ANA MARIA DEL CARMEN BLANCO Y BLANCO Y GONZALEZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ANA MARIA PEÑAFIEL%') 
where s.NOMBRE_CLIENTE = 'ANA MARIA PEÐAFIEL SANCHEZ DE ALONSO';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ANA MARIA PEÑAFIEL%') 
where s.NOMBRE_CLIENTE = 'ANA MARIA PEÐAFIEL SANCHEZ DE ALONSO';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ANA MARQUEZ%') 
where s.NOMBRE_CLIENTE = 'ANA MARQUES';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ANA MORG%') 
where s.NOMBRE_CLIENTE = 'ANA MORGAN ROJAS';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ANA PATRICIA GUTIERREZ%') 
where s.NOMBRE_CLIENTE = 'ANA PATRICIA GUTIERREZ PEÐALOZA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ANDRES  LEITES%') 
where s.NOMBRE_CLIENTE = 'ANDRES LEITES VILNERLEO SERGE';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ANGEL RUIZ ROJAS%') 
where s.NOMBRE_CLIENTE = 'ANGEL RU═Z ROJAS';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ANGELA ORTEGA GARDU%') 
where s.NOMBRE_CLIENTE = 'ANGELA ORTEGA GARDUÐO';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ANGELINA CASTI%') 
where s.NOMBRE_CLIENTE = 'ANGELINA CASTIÐEIRA D═AZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ANTONIO ORDOÑEZ RIOS%') 
where s.NOMBRE_CLIENTE = 'ANTONIO ORDOÐEZ RIOS';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ANTONIO PEREZ SANCHEZ%') 
where s.NOMBRE_CLIENTE = 'ANTONIO P╔REZ SANCHEZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ANTONIO RODRIGUEZ DIEZ%') 
where s.NOMBRE_CLIENTE = 'ANTONIO RODR═GUEZ DIEZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ANTONIO SANCHEZ GARCIA%') 
where s.NOMBRE_CLIENTE = 'ANTONIO S┴NCHEZ GARC═A';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%APOLINAR SANCHEZ CASTAÑEDA%') 
where s.NOMBRE_CLIENTE = 'APOLINAR SANCHEZ CASTAÐEDA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ARACELI CABALLERO DOMINGUEZ%') 
where s.NOMBRE_CLIENTE = 'ARACELI CABALLERO DOMINGUEZ DE MINGO';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ARCELIA   KARINA MARTINEZ SEGURA%') 
where s.NOMBRE_CLIENTE = 'ARCELIA KARINA MARTINEZ SEGURA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ARMANDO RUIZ PEÑA%') 
where s.NOMBRE_CLIENTE = 'ARMANDO RUIZ PEÐA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%AURIA HERNANDO%') 
where s.NOMBRE_CLIENTE = 'AURIA HERNANDO Y QUIZAÐOS';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%AURIA HERNANDO%') 
where s.NOMBRE_CLIENTE = 'AURORA MARTINEZ GALV┴N';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = 
(select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%RAFAEL NEY LIZARDI%') 
where s.NOMBRE_CLIENTE = 'RAFAEL NEY LIZARDI Y ALBARRAN';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = 
(select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%RICARDO MIRANDA%') where s.NOMBRE_CLIENTE = 'RICARDO MIRANDA HERNANDEZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%SAMUEL FUENLABRADA%') 
where s.NOMBRE_CLIENTE = 'SAMUEL FUENLABRADA DE LA VEGA FUENLABRADA DE LA VEGA TRUCIOS';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ALICIA LAZO DE%') 
where s.NOMBRE_CLIENTE = 'ALICIA LAZO DELA VEGA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ALICIA LAZO DE%') 
where s.NOMBRE_CLIENTE = 'ALICIA LAZO DELA VEGA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ANGEL IÐURRIA OROPEZA%') 
where s.NOMBRE_CLIENTE = 'ANGEL IÐURRIA OROPEZA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%AURORA MONTE%') 
where s.NOMBRE_CLIENTE = 'AURORA MONTE DE OCA MARTINEZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%BAHI%') 
where s.NOMBRE_CLIENTE = 'BAHI BUZALI DE ZAGA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%BARBARA  HELEN%') 
where s.NOMBRE_CLIENTE = 'BARBARA HELEN WARD';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%BENITO AGUILAR CAB%') 
where s.NOMBRE_CLIENTE = 'BENITO AGUILAR CABAÐAS';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%BLANCA VILLAZON%') 
where s.NOMBRE_CLIENTE = 'BLANCA VILLAZON SAGUN';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%CARLOS GARDUÐO PLIEGO%') 
where s.NOMBRE_CLIENTE = 'CARLOS GARDUÐO PLIEGO';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%CARMEN ALANIS GONZ%') 
where s.NOMBRE_CLIENTE = 'CARMEN ALANIS GONZ┴LEZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%CARMEN BERROCAL%') 
where s.NOMBRE_CLIENTE = 'CARMEN BERROCAL MORA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%CARMEN GËMEZ DE RU%') 
where s.NOMBRE_CLIENTE = 'CARMEN GËMEZ DE RU═Z';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%CELESTINA  EU%') 
where s.NOMBRE_CLIENTE = 'CELESTINA EUFROSINA GUZMAN MORALES';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%CLAUDIA  ANGELICA%') 
where s.NOMBRE_CLIENTE = 'CLAUDIA ANGELICA FERREIRA FERNANDEZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%CONSUELO PADILLA%') 
where s.NOMBRE_CLIENTE = 'CONSUELO PADILLA DE ISUNZA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%DANIEL VILLARUEL MARQUEZ%') 
where s.NOMBRE_CLIENTE = 'DANIEL VILLARRUEL MARQUEZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%DANIELA ROQUE%') 
where s.NOMBRE_CLIENTE = 'DANIELA ROQUE PIÐA ROQUE PIÐA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ELISA VARGAS%') 
where s.NOMBRE_CLIENTE = 'ELISA VARGAS LUGO';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%EMELIA MARQU%') 
where s.NOMBRE_CLIENTE = 'EMELIA MARQUES CISNEROS';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%EUGENIA CAMPOS DE BRENN%') 
where s.NOMBRE_CLIENTE = 'EUGENIA BRENN';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%EULALIO CRUZ%') 
where s.NOMBRE_CLIENTE = 'EULALIO CRUZ VELASQUEZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%FELIX OCA%') 
where s.NOMBRE_CLIENTE = 'FELIX OCAÐA URBAN';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%PEDRO FERNANDO CORTE Y LOPEZ%') 
where s.NOMBRE_CLIENTE = 'FERNANDO CORTE LOPEZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%FULGENCIO MARTINEZ PE%') 
where s.NOMBRE_CLIENTE = 'FULGENCIO MARTINEZ PEÐA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%GILBERTO  GABRIEL SOLIS GUZMAN%') 
where s.NOMBRE_CLIENTE = 'GILBERTO GABRIEL SOLIS GUZMAN';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%GLORIA EDITH ESCAMILLA%') 
where s.NOMBRE_CLIENTE = 'GLORIA ESCAMILLA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%GLORIA  ESTEFAN COLIN%') 
where s.NOMBRE_CLIENTE = 'GLORIA ESTEFAN COLIN';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%GONZALO ARMANDO ESPONDA ZEBADUA%') 
where s.NOMBRE_CLIENTE = 'GONZALO ESPONDA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%GUILLERMO MACIAS GARCIA%') 
where s.NOMBRE_CLIENTE = 'GUILLERMO MACIASGARCIA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%HAZEL HORCASITAS VARGAS%') 
where s.NOMBRE_CLIENTE = 'HAZEL HORCACITAS VARGAZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%HERMANA%') 
where s.NOMBRE_CLIENTE = 'HERMANA MARIA DEL SOCORRO ARREDONDO AGUILAR';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%HORST%') 
where s.NOMBRE_CLIENTE = 'HORST MOELLER';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ISABEL GARCIADIEGO%') 
where s.NOMBRE_CLIENTE = 'ISABEL GARCIADIEGO DE NUÐEZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%JAIME CERVANTES DE LA  GARZA%') 
where s.NOMBRE_CLIENTE = 'JAIME CERVANTES DE LA GARZA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%JAIME MATHIEU BARRIOS%') 
where s.NOMBRE_CLIENTE = 'JAIME MATHU';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%JORGE SOLAR GONZ%') 
where s.NOMBRE_CLIENTE = 'JORGE SOLAR GONZ┴LEZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%JOSE ALBERTO MORA  CASTELLANOS%') 
where s.NOMBRE_CLIENTE = 'JOSE ALBERTO MORA CASTELLANOS';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%JOSE AVILES%') 
where s.NOMBRE_CLIENTE = 'JOSE AVILES HERRERA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%JOSE LUIS GONZALEZ PE%') 
where s.NOMBRE_CLIENTE = 'JOSE LUIS GONZALEZ PEÐA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%JOSE ZUÐIGA GARCIA%') 
where s.NOMBRE_CLIENTE = 'JOSE ZUÐIGA GARCIA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%JOSEFINA CHAVEZ%') 
where s.NOMBRE_CLIENTE = 'JOSEFINA CHAVEZ VILLEGAS';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%JUAN ANTONIO ESPINOZA MONTESINOS%') 
where s.NOMBRE_CLIENTE = 'JUAN ANTONIO ESPINOSA MONTESINOS';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%JUAN FRANCISCO BLEHAUT%') 
where s.NOMBRE_CLIENTE = 'JUAN FRANCISCO BLEHUAT';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%JUAN  ISIDRO GIRON MIRANDA%') 
where s.NOMBRE_CLIENTE = 'JUAN ISIDRO GIRON MIRANDA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%JUAN LUIS ESTEVEZ%') 
where s.NOMBRE_CLIENTE = 'JUAN LUIS ESTEVEZ AGUILAR';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%JUANA MICHAN DE CHAYO%') 
where s.NOMBRE_CLIENTE = 'JUANI MICHAN DE CHAYO';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%JULIA LILIA%') 
where s.NOMBRE_CLIENTE = 'JULIA LILIA LOPEZ VILLENA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%KHEBZO%') 
where s.NOMBRE_CLIENTE = 'KHEBZO JOSETH CHATAH';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%LEA ROSENTHAL%') 
where s.NOMBRE_CLIENTE = 'LEA ROSENTHAL DE K ROSENTHAL DE K';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%LETICIA MART%') 
where s.NOMBRE_CLIENTE = 'LETICIA MART═NEZ AYANEGUI';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%MA. DE LAS MERCEDES%') 
where s.NOMBRE_CLIENTE = 'MA. DE LAS MERCEDES LARA CAÐIZAVES';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%MA. DE LOS ANGELES SAMANO%') 
where s.NOMBRE_CLIENTE = 'MA. DE LOS ANGELES SAMANO DE SALAME';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%MANUEL LËPEZ%') 
where s.NOMBRE_CLIENTE = 'MANUEL LËPEZ JU┴REZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%MARIA DE LA PAZ  DE LEON MARTINEZ%') 
where s.NOMBRE_CLIENTE = 'MARIA CONCEPCION LEON MARTINEZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%MARIA DE LOS ANGELES GUERRERO LUNA%') 
where s.NOMBRE_CLIENTE = 'MARIA D LOS ANGELES GUERRERO LUNA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%MARIA DE JESUS  YAZMIN  RAMIREZ ALMANZA%') 
where s.NOMBRE_CLIENTE = 'MARIA DE JESUS YAZMIN RAMIREZ ALMANZA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%MARIA  DE LA LUZ PICHARDO ESTRADA%') 
where s.NOMBRE_CLIENTE = 'MARIA DE LA LUZ PICHARDO ESTRADA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%MARIA DEL CARME SOTO%') 
where s.NOMBRE_CLIENTE = 'MARIA DEL CARME SOTO RU═Z DE TORRESCANO';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%MARIA  DEL CARMEN ANDRADE RODRIGUEZ%') 
where s.NOMBRE_CLIENTE = 'MARIA DEL CARMEN ANDRADE RODRIGUEZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%MARIA DEL  CARMEN LUEVANOS AGUILAR%') 
where s.NOMBRE_CLIENTE = 'MARIA DEL CARMEN LUEVANO AGUILAR';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%MARIA  DEL REFUGIO TOPETE CORDOBA%') 
where s.NOMBRE_CLIENTE = 'MARIA DEL REFUGIO TOPETE CORDOBA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%MARIA  ELENA MUÑOZ CHAVEZ%') 
where s.NOMBRE_CLIENTE = 'MARIA ELENA MUÐOZ CHAVEZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%MARIA  LETICIA VAZQUEZ OROPEZA%') 
where s.NOMBRE_CLIENTE = 'MARIA LETICIA VAZQUEZ OROPEZA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%TODD%') 
where s.NOMBRE_CLIENTE = 'MARIA LUISA SANCHEZ TODD';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%MARTHA CORTES%') 
where s.NOMBRE_CLIENTE = 'MARTHA CORTES TEYSSIR';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%MARTHA CATALINA  MUNDO   NUÑEZ%') 
where s.NOMBRE_CLIENTE = 'MARTHA MUNDO';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%MARTHA TERRAZAS DE LA PE%') 
where s.NOMBRE_CLIENTE = 'MARTHA TERRAZAS DE LA PEÐA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%MARIA  DEL CARMEN MORALES FERRON%') 
where s.NOMBRE_CLIENTE = 'MAR═A DEL CARMEN MORALES FERRËN';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%MARIA LILIA TELLEZ REYES%') 
where s.NOMBRE_CLIENTE = 'MAR═A LILIA TELLES REYES';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%MAR?A TERESA BARRËN VARGAS%') 
where s.NOMBRE_CLIENTE = 'MAR═A TERESA BARRËN VARGAS';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%SEBASTIAN GALINDO%') 
where s.NOMBRE_CLIENTE = 'MAURICIO SEBASTIAN GALINDO LEON';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%MOIS?S MORGENSTEIN%') 
where s.NOMBRE_CLIENTE = 'MOIS╔S MORGENSTEIN';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%NADIA BRANKODICH WEIMAN%') 
where s.NOMBRE_CLIENTE = 'NADIA BRANCOVICH WEIMAN';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%EVERARDO OSORIO QUINTANA%') 
where s.NOMBRE_CLIENTE = 'NIÐO EVERARDO OSORIO QUINTANA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%LOPEZ ANGELES%') 
where s.NOMBRE_CLIENTE = 'OCTAVIO ALEJANDRO LOPEZ ANGELES';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%PEÑA CALZADA%') 
where s.NOMBRE_CLIENTE = 'OFELIA DE LA PEÐA CALZADA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%FRIDMAN%') 
where s.NOMBRE_CLIENTE = 'OLGA GOLPER FRIDMAN';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%OSWALDO PAVON  PADILLA%') 
where s.NOMBRE_CLIENTE = 'OSWALDO PAVON PADILLA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%PAOLO ROBOTI%') 
where s.NOMBRE_CLIENTE = 'PAOLO ROBOTI F.';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%PILAR ISLA ORDO%') 
where s.NOMBRE_CLIENTE = 'PILAR ISLA ORDOÐANA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%RICARDO MIRANDA HERN%') 
where s.NOMBRE_CLIENTE = 'RICARDO MIRANDA HERN┴NDEZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%SALOMËN S%') 
where s.NOMBRE_CLIENTE = 'SALOMËN SAADIA';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%SANTOS MANJARREZ CASAS%') 
where s.NOMBRE_CLIENTE = 'SANTOS MANJARRES CASAS';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%LAHAM%') 
where s.NOMBRE_CLIENTE = 'SARA EDID LAHAM';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%SAUL GUTIERREZ SUAREZ%') 
where s.NOMBRE_CLIENTE = 'SAUL GUTIERRES SUAREZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%SENEN RAM%') 
where s.NOMBRE_CLIENTE = 'SENEN RAM═REZ JIM╔NEZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%YOLANDA MEZA NU%') 
where s.NOMBRE_CLIENTE = 'YOLANDA MEZA NUÐEZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%ABDUL%') 
where s.NOMBRE_CLIENTE = 'YAMILE ABDUL MASSIH TRAD DE TRAD';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%XAVIER FERN%') 
where s.NOMBRE_CLIENTE = 'XAVIER FERN┴NDEZ HURTADO';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%VIVIANA MARTINEZ MU%') 
where s.NOMBRE_CLIENTE = 'VIVIIANA MARTINEZ MUÐOZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%VICTOR  MANUEL MENDOZA VAZQUEZ%') 
where s.NOMBRE_CLIENTE = 'VICTOR MANUEL MENDOZA VAZQUEZ';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%VALENTIN CASTRO%') 
where s.NOMBRE_CLIENTE = 'VALENTIN CASTRO ANTOÐANO';
update SERIES_VENDIDOS_PRI_TODOS s set s.CLIENTE_ID_MICROSIP = (select c.CLIENTE_ID from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%SERGIO PEREZ SANCHEZ%') 
where s.NOMBRE_CLIENTE = 'SERGIO P╔REZ S┴NCHEZ P╔REZ S┴NCHEZ';

select * from CLIENTES_CON_ID_MICROSIP c where c.NOMBRE like '%SERGIO PEREZ SANCHEZ%' order by c.NOMBRE; 


--select * from UPDATE_ID_MICROSIP;
--select * from UPDATE_ID_MICROSIP_2;



select count(*) from SERIES_VENDIDOS_PRI_TODOS s where s.CLIENTE_ID_MICROSIP is null ;
