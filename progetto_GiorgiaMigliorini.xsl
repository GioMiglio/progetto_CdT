<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output method="html" encoding="UTF-8"/>

    <!--NOTE tramite id/ref-->
     <xsl:key name="noteById" match="tei:note" use="@xml:id" />
    <!--PERSONE tramite id/ref-->
      <xsl:key name="persName-by-id" match="tei:persName" use="@xml:id" />
    <!--ORGANIZZAZIONI tramite id/ref-->
     <xsl:key name="org-by-id" match="tei:org" use="@xml:id" />


    <xsl:template match="/">
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                 <link rel="stylesheet" type="text/css" href="progettostile.css" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"/>
                 <script type="text/javascript" src="progetto.js"></script>
                <title>Progetto di Codifica di Testi</title>
            </head>

            <body>
                <div id="logo">
                    <img src="logo2.png" alt="La_Rassegna_Settimanale"/>
                </div>
                <div id="tit1">
                    <h2>
                        <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type='main']"/>
                    </h2>
                    <h3>
                        
                       <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type='sub']"/>

                    </h3>
                    <p>
                        <b>Fondata da: </b>
                        <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:funder"/>
                    </p>

                    <p>                
                        <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt"/>    
                    </p>
                    <img src="Logo-UNIIPI-nero.png" alt="Unipi"/>
                </div>
                <!--Descrizioni-->
                <div id="descrizioni">
                    <h2>Descrizione del progetto:</h2>
                    <div id="profile_desc">
                        <p>
                            <xsl:value-of select="tei:TEI/tei:teiHeader/tei:profileDesc/tei:abstract"/>
                        </p>
                    </div>
                      <div id="profile_desc_text_class">
                        <p>
                            <div class="circle-container">
                             <div class="center-text"><b>Parole chiave:</b></div>
                            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:profileDesc/tei:textClass/tei:keywords"/>
                            </div>
                        </p>
                    </div>
                    <div id="encoding_desc">
                            
                            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:encodingDesc/tei:projectDesc"/>
                            <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:encodingDesc/tei:editorialDecl"/>
                    </div>
                    <div id="source_desc">
                    <h2>Descrizione della fonte:</h2>
                        <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc"/>
                    </div>
                </div>
                <!--Legenda fenomeni notevoli e bottoni per highlight-->
                <div id="bottoni">
                   <h2>Fenomeni Notevoli</h2>
                   <p>Clicca sui bottoni ed evidenzia gli elementi di codifica che più ti interessano</p>

                        <button id="persone" class="red">Persone</button>
                        <button id="personaggi" class="yellow">Personaggi</button>
                        <button id="Luoghi_countries" class="DeepPink">Paesi e Regioni</button>
                        <button id="Luoghi_settlements" class="Pink">Città e Villaggi</button>
                        <button id="Luoghi_n" class="purple">Luoghi naturali</button>
                        <button id="ref_bibl" class="orange">Referenze bibliografiche</button>
                        <button id="CasaEd" class="DarkOrange">Casa editrice</button>
                        <button id="Date" class="LawnGreen">Date</button>
                        <button id="sic" class="DarkGreen">Errori e correzioni</button>
                        <button id="regolarizzazioni" class="cyan">Originali e Regolarizzate</button>
                        <button id="literary_usage" class="Blue">Licenze letterarie</button>
                        <button id="testo_lingua" class="brown">Testo in lingua straniera</button>
                        <button id="citazioni" class="DarkSalmon">Citazioni</button>
                        <button id="quotes" class="Salmon">Quotes</button>               
                        <button id="org" class="Maroon">Organizzazioni</button>
                        <button id="epithet_rolenames" class="DarkCyan">Epiteti e Apposizioni</button>
                      
                       
                </div>

                <!--TESTI-->
                <div id="all_articles">
                  <div id="all_primoarticolo" class="all">
                    <div id="testo_primoarticolo" class="text">
                       <xsl:apply-templates select="//tei:text[@xml:id='le_vacanze_del_parlamento_e_la_politica_interna']"/> <!--// tutti gli elementi tei:x, indipendentemente dalla gerarchia, con id specificato-->
                  
                    </div>
                    <div id="img_primoarticolo" class="image">
                       <xsl:apply-templates select="//tei:surface[@xml:id='pagina53']"/> <!--// tutti gli elementi tei:x, indipendentemente dalla gerarchia, con id specificato-->
                    </div>
                  </div>

                   <div id="all_secondoarticolo" class="all">
                    <div id="testo_secondoarticolo" class="text">
                       <xsl:apply-templates select="//tei:text[@xml:id='il_parassitismo_letterario']"/> <!--// tutti gli elementi tei:x, indipendentemente dalla gerarchia, con id specificato-->
                  
                    </div>
                    <div id="img_secondoarticolo" class="image">
                       <xsl:apply-templates select="//tei:surface[@xml:id='pagina64']"/> <!--// tutti gli elementi tei:x, indipendentemente dalla gerarchia, con id specificato-->
                    </div>
                  </div>
                </div>

                <div id="all_bibliografia">            
                 
                    <!--bibl1-->
                    <div id="all_terzoarticolo" class="all">
                     <div id="letteratura_e_storia" class="text">
                         <xsl:apply-templates select="//tei:text[@xml:id='letteratura_e_storia']"/> <!--// tutti gli elementi tei:x, indipendentemente dalla gerarchia, con id specificato-->
                      </div>
                    
                      <div id="img_terzoarticolo" class="image">
                         <xsl:apply-templates select="//tei:surface[@xml:id='pagina64']"/> 
                         <xsl:apply-templates select="//tei:surface[@xml:id='pagina65']"/> <!--// tutti gli elementi tei:x, indipendentemente dalla gerarchia, con id specificato-->
                         <xsl:apply-templates select="//tei:surface[@xml:id='pagina66']"/>
                      </div>
                      </div>
                    <!--bibl2-->
                    <div id="all_quartoarticolo" class="all">
                      <div id="libri_per_fanciulli" class="text">
                         <xsl:apply-templates select="//tei:text[@xml:id='libri_per_fanciulli']"/> <!--// tutti gli elementi tei:x, indipendentemente dalla gerarchia, con id specificato-->
                      </div>
                 
                      <div id="img_quartoarticolo" class="image">
                        <xsl:apply-templates select="//tei:surface[@xml:id='pagina68']"/> <!--// tutti gli elementi tei:x, indipendentemente dalla gerarchia, con id specificato-->
                      </div>
                      </div>
                    </div>
                
                <div id="all_notizie">
                     <div class="all">
                          <div id="Notizie" class="text">
                          <xsl:apply-templates select="//tei:text[@xml:id='Notizie']"/>                      
                          </div>
                           <div id="img_notizie" class="image">
                            <xsl:apply-templates select="//tei:surface[@xml:id='pagina68_1']"/> 
                           </div>
                     </div>    
                </div>
             

               


                
            </body>
        </html>
    </xsl:template>

 
<xsl:template match="tei:titleStmt/tei:funder">
  <xsl:for-each select="tei:persName">
    <!-- Se è l'ultimo elemento della lista -->
    <xsl:if test="position() = last() - 1">
      <xsl:value-of select="." />
      <xsl:text> e </xsl:text>
    </xsl:if>

    <!-- Se non è l'ultimo elemento -->
    <xsl:if test="position() &lt; last() - 1">
      <xsl:value-of select="." />
      <xsl:text>, </xsl:text>
    </xsl:if>

    <!-- Se è l'ultimo elemento (senza la virgola finale) -->
    <xsl:if test="position() = last()">
      <xsl:value-of select="." />
    </xsl:if>
  </xsl:for-each>
</xsl:template>


    <xsl:template match="tei:editionStmt">
        <xsl:value-of select="tei:edition"/><xsl:value-of select="tei:date"/>
        <br />
        <xsl:for-each select="tei:respStmt">
            <xsl:value-of select="tei:resp"/><xsl:value-of select="tei:name"/>
              <br />
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="tei:textClass/tei:keywords">
     <xsl:for-each select="tei:term">
     <xsl:element name="div">
       <xsl:attribute name="class">word</xsl:attribute>
       <p><xsl:value-of select="."/></p>
     </xsl:element>
       
     </xsl:for-each>
    </xsl:template>

    <xsl:template match="tei:encodingDesc/tei:projectDesc">
        <xsl:for-each select="tei:p">
            <xsl:value-of select="."/><br /> 
                              
        </xsl:for-each>       
    </xsl:template>

    <xsl:template match="tei:encodingDesc/tei:editorialDecl">
        <p>
            <xsl:apply-templates />
        </p>

    </xsl:template>


    <xsl:template match="//tei:gi">
    <b><xsl:value-of select="."/></b>
    </xsl:template>

    <xsl:template match="tei:sourceDesc">
        <!--source generale: intero editoriale-->
        <i>Sulla Rassegna</i>
        <p><b>Titolo: </b><xsl:value-of select="tei:biblStruct/tei:monogr/tei:title[@type='main']"/> <xsl:value-of select="tei:biblStruct/tei:monogr/tei:title[@type='sub']"/>
        <br />
        <xsl:apply-templates select="tei:biblStruct/tei:monogr/tei:imprint"/>
        </p>
        
        <p><b>Articoli selezionati: </b><br />
            <xsl:apply-templates select="tei:biblStruct/tei:analytic"/>
        </p>

     <!--source specifica: provenienza degli articoli-->
        <p><xsl:apply-templates select="tei:biblStruct/tei:monogr"/></p>

    <!--nota-->
        <p><xsl:value-of select="tei:biblStruct/tei:note"/></p>
    </xsl:template>

    <xsl:template match="tei:imprint">
       <p><b>Pubblicato da: </b><xsl:value-of select="tei:publisher"/></p>
       <p><b>Luogo di pubblicazione: </b><xsl:value-of select="tei:pubPlace"/></p>
       <p><b>Data di pubblicazione: </b><xsl:value-of select="tei:date"/></p> 
    </xsl:template>

 <xsl:template match="tei:analytic">
    <!-- Gestisce la corretta visualizzazione dei titoli principali e secondari -->
    <xsl:for-each select="tei:title">
        <xsl:if test="@type = 'main'">
        <br />
            <!-- Titolo principale (main), che appare normalmente -->
            <span class="main-title"><xsl:value-of select="." /></span>
        </xsl:if>

        <xsl:if test="@type = 'sub'">
            <!-- Titolo secondario (sub), che appare accanto al principale -->
            <span class="sub-title"><xsl:value-of select="." /></span>
        </xsl:if>
        <br />
    </xsl:for-each>
</xsl:template>


    <xsl:template match="tei:sourceDesc/tei:biblStruct/tei:monogr">
    <i>Sul Volume</i>
    <xsl:for-each select="tei:biblScope">
       <xsl:if test="@unit = 'volume'">
         <p><b>Volume: </b><xsl:value-of select="."/></p>
       </xsl:if>
       <xsl:if test="@unit = 'issue'">
          <p><b>Issue: </b><xsl:value-of select="."/></p>
       </xsl:if>

       <xsl:if test="@unit = 'date'">
       <p><b>Data di pubblicazione: </b><xsl:value-of select="."/></p>
       </xsl:if>

       <xsl:if test="@unit = 'pag'">
       <p><b>Pagine: </b><xsl:value-of select="."/></p>
       </xsl:if>

       <xsl:if test="@unit = 'place'">
       <p><b>Luogo di pubblicazione: </b> <xsl:value-of select="."/></p>
       </xsl:if>
    </xsl:for-each>
     
    </xsl:template>

   

    
     <!-- Template principale per la struttura della pagina -->
<xsl:template match="tei:text">

    <!-- Titolo della pagina -->
    
    <h2><xsl:value-of select="tei:front/tei:div/tei:head"/></h2>
    
       
            <for-each select="tei:body/tei:div[@type='page']">
            <div class="column-pair">
                <xsl:apply-templates select="tei:body/tei:div[@type='page']/tei:div"/>
            </div>
            </for-each>

     
</xsl:template>


<!-- Template per la gestione dei div che contengono i paragrafi -->
<xsl:template match="//tei:div">

 <xsl:choose>
  
        <xsl:when test="matches(@xml:id, '.*_colSX$')">
            <div class="left-column">
              <xsl:apply-templates select="tei:ab"/>
                <xsl:apply-templates select="tei:p"/>
              
            </div>
        </xsl:when>
        
    
        <xsl:when test="matches(@xml:id, '.*_colDX$')">
            <div class="right-column">
                <xsl:apply-templates select="tei:p"/>
                <xsl:apply-templates select="tei:ab"/>
              
            </div>
       
        </xsl:when>
  
    </xsl:choose>



</xsl:template>





<!--Paragrafi-->
<xsl:template match="tei:p">    

 <xsl:choose>
        <!-- Caso per 'first-line-indent justify' -->
        <xsl:when test="@rend = 'first-line-indent justify'">
              <p class="first-line-indent-justify">

                 <xsl:element name="span">
                 <xsl:attribute name="class">zone</xsl:attribute>
                 <xsl:attribute name="id"><xsl:value-of select="@xml:id" /></xsl:attribute>
                 <xsl:apply-templates />
                 </xsl:element>
             </p>
        </xsl:when>
        
        <!-- Caso generico per altri paragrafi senza indentazione -->
        <xsl:otherwise>
           <p>
                <xsl:element name="span">
                <xsl:attribute name="class">zone</xsl:attribute>
                <xsl:attribute name="id"><xsl:value-of select="@xml:id" /></xsl:attribute>
                <xsl:apply-templates />
                </xsl:element>
           </p>
        </xsl:otherwise>
</xsl:choose> 
</xsl:template>

<!--caso ab-->
<xsl:template match="tei:ab">    

 <xsl:choose>
        <!-- Caso per 'first-line-indent justify' -->
        <xsl:when test="@rend = 'first-line-indent justify'">
              <p class="first-line-indent-justify">

                 <xsl:element name="span">
                 <xsl:attribute name="class">zone</xsl:attribute>
                 <xsl:attribute name="id"><xsl:value-of select="@xml:id" /></xsl:attribute>
                 <xsl:apply-templates />
                 </xsl:element>
             </p>
        </xsl:when>
        
        <!-- Caso generico per altri paragrafi senza indentazione -->
        <xsl:otherwise>
             <p>
                <xsl:element name="span">
                <xsl:attribute name="class">zone</xsl:attribute>
                <xsl:attribute name="id"><xsl:value-of select="@xml:id" /></xsl:attribute>
                <xsl:apply-templates />
                </xsl:element>
             </p>
        </xsl:otherwise>
</xsl:choose> 
</xsl:template>

<!--testo corsivo - non in caso di testo in lingua straniera, perchè gestito separatemente-->
<xsl:template match="tei:*[@rend='italic'][not(self::tei:foreign)]">
    <i>
        <xsl:apply-templates select="node()"/>
    </i>
</xsl:template>


<!--note aggiunte nel testo-->
<xsl:template match="//tei:ref[@ana]">

        <xsl:element name="span">
            <xsl:attribute name="class">popup</xsl:attribute>
            <xsl:attribute name="id">
                <xsl:value-of select="'popup_'"/>
                <xsl:value-of select="@ana"/>
            </xsl:attribute>
          <xsl:value-of select="key('noteById', @ana)"/>

        <br />
        <xsl:if test="key('noteById', @ana)/@resp">
        <xsl:text> (Responsabile: </xsl:text>
        <xsl:value-of select="key('noteById', @ana)/@resp"/>
        <xsl:text>)</xsl:text>
        </xsl:if>

        </xsl:element>
   
       <xsl:element name="a">
            <xsl:attribute name="href">#</xsl:attribute>
            <xsl:attribute name="class">popup-trigger</xsl:attribute>
            <xsl:attribute name="id"><xsl:value-of select="@ana"/></xsl:attribute>
            <xsl:number format="[1]" level="any"/>
        </xsl:element>
    
</xsl:template>



<!--interruzione di riga-->
<xsl:template match="//tei:lb">
    <br />
</xsl:template>



   

<!--gestione correzioni e regolarizzazioni-->
<xsl:template match="//tei:corr">
    <span class="correzioni" style="display:none;">
        <b><xsl:value-of select="." /></b>
    </span>
</xsl:template>

<xsl:template match="//tei:reg">
    <span class="regolarizzate" style="display:none;">
        <b><xsl:value-of select="." /></b>
    </span>
</xsl:template>

<xsl:template match="//tei:expan">
    <span class="regolarizzate" style="display:none;">
        <b><xsl:value-of select="." /></b>
    </span>
</xsl:template>

     <xsl:template match="tei:surface">
        <xsl:element name="img">
            <xsl:attribute name="class">small</xsl:attribute>
            <xsl:attribute name="src"><xsl:value-of select="current()[@xml:id]//tei:graphic/@url"/></xsl:attribute>
            <xsl:attribute name="usemap">#<xsl:value-of select="current()/@xml:id" /></xsl:attribute>
        </xsl:element>
        <xsl:element name="map">
            <xsl:attribute name="name"><xsl:value-of select="current()/@xml:id"/></xsl:attribute>
            <!--per ogni zona, è creato un elemento area-->
            <xsl:for-each select="tei:zone">
                <xsl:element name="area">
                <!--attributi dell'elemento area-->
                    <xsl:attribute name="id"><xsl:value-of select="current()/@corresp" /></xsl:attribute> <!--valore dell'attributo xml corresp-->
                    <xsl:attribute name="coords"><xsl:value-of select="current()/@ulx"/>,<xsl:value-of select="current()/@uly"/>,<xsl:value-of select="current()/@lrx"/>,<xsl:value-of select="current()/@lry"/></xsl:attribute> <!--valore delle coordinate (angoli alti e bassi) della zona cliccabile dell'immagine-->
                    <xsl:attribute name="style">cursor: pointer</xsl:attribute>
                    <xsl:attribute name="shape">rect</xsl:attribute>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>


<!--gestione fenomeni notevoli-->
<!--PERSONE-->
 <xsl:template match="tei:persName">
 <xsl:choose>
  <xsl:when test="@ref">

        <xsl:variable name="id" select="substring-after(@ref, '#')"  />
        
        <!-- Trova il link corrispondente utilizzando la chiave -->
        <xsl:variable name="link" select="key('persName-by-id', $id)/@ref" />  
          
            <xsl:element name="span">
             <xsl:attribute name="class">persone</xsl:attribute>
             <a href="{ $link }">         
                    <xsl:apply-templates />
            </a> 
              </xsl:element> 
    </xsl:when>
    <xsl:otherwise>
     <xsl:element name="span">
            <xsl:attribute name="class">persone</xsl:attribute>
                   <xsl:apply-templates />
        </xsl:element>
    </xsl:otherwise>  
   </xsl:choose>      
    </xsl:template>

<!--PERSONAGGI-->
 <xsl:template match="tei:persName[@role='character']">
   <xsl:element name="span">
            <xsl:attribute name="class">personaggi</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
 </xsl:template>

 <!--EPITETI-->
  <xsl:template match="//tei:addName">
   <xsl:element name="span">
            <xsl:attribute name="class">epithet_rolenames</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
 </xsl:template>
   <xsl:template match="//tei:roleName">
 <xsl:choose>
  <xsl:when test="@ref">

        <xsl:variable name="id" select="substring-after(@ref, '#')"  />
        
        <!-- Trova il link corrispondente utilizzando la chiave -->
        <xsl:variable name="link" select="key('persName-by-id', $id)/@ref" />  
          
            <xsl:element name="span">
             <xsl:attribute name="class">epithet_rolenames</xsl:attribute>
             <a href="{ $link }">         
                    <xsl:apply-templates />
            </a> 
              </xsl:element> 
    </xsl:when>
    <xsl:otherwise>
     <xsl:element name="span">
            <xsl:attribute name="class">epithet_rolenames</xsl:attribute>
                   <xsl:apply-templates />
        </xsl:element>
    </xsl:otherwise>  
   </xsl:choose>      
 </xsl:template>

<!--LUOGHI-->
 <xsl:template match="tei:country">
        <xsl:element name="span">
            <xsl:attribute name="class">Luoghi_countries</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
</xsl:template>
 <xsl:template match="tei:region">
        <xsl:element name="span">
            <xsl:attribute name="class">Luoghi_countries</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
</xsl:template>
 <xsl:template match="tei:term[@type='geographic_region']">
        <xsl:element name="span">
            <xsl:attribute name="class">Luoghi_countries</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
</xsl:template>
 <xsl:template match="tei:term[@type='national_concept']">
        <xsl:element name="span">
            <xsl:attribute name="class">Luoghi_countries</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
</xsl:template>
 <xsl:template match="tei:settlement">
        <xsl:element name="span">
            <xsl:attribute name="class">Luoghi_settlements</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
</xsl:template>
 <xsl:template match="tei:geogName">
        <xsl:element name="span">
            <xsl:attribute name="class">Luoghi_n</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
</xsl:template>
 <xsl:template match="tei:geogFeat">
        <xsl:element name="span">
            <xsl:attribute name="class">Luoghi_n</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
</xsl:template>

<!--OPERE-->

<xsl:template match="tei:bibl">
        <xsl:element name="span">
            <xsl:attribute name="class">ref_bibl</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
</xsl:template>

<!--ORGANIZZAZIONI-->
<!--casa editrice-->
<xsl:template match="tei:orgName[@type='editorial']">
        <xsl:element name="span">
            <xsl:attribute name="class">CasaEd</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
</xsl:template>

<!--DATE-->
<xsl:template match="tei:date">
        <xsl:element name="span">
            <xsl:attribute name="class">Date</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
</xsl:template>

<!--DISTINCT: TERMINI ARCAICI-->
<xsl:template match="tei:distinct">
     <xsl:element name="span">
            <xsl:attribute name="class">regolarizzazioni</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
</xsl:template>

<!--ERRORI E DISPLAY CORREZIONI-->
    <xsl:template match="tei:sic">
        <xsl:element name="span">
            <xsl:attribute name="class">sic</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

        <xsl:template match="tei:orig">
        <xsl:element name="span">
            <xsl:attribute name="class">regolarizzazioni</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
            <xsl:template match="tei:expan">
        <xsl:element name="span">
            <xsl:attribute name="class">regolarizzazioni</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:abbr">
        <xsl:element name="span">
            <xsl:attribute name="class">regolarizzazioni</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

<!--TERMINI USO LETTERARIO-->
    <xsl:template match="tei:term[@type='literary_usage']">
        <xsl:element name="span">
            <xsl:attribute name="class">literary_usage</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

<!--TERMINI/ESPRESSIONI/FRASI IN LINGUA STRANIERA-->
<xsl:template match="tei:foreign">
<xsl:choose>
<xsl:when test="@rend='italic'">
  <!--in caso di corsivo-->
  <xsl:element name="span">
        <xsl:attribute name="class">testo_lingua</xsl:attribute>
        <i>
            <xsl:apply-templates select="node()"/>
        </i>
    </xsl:element>
</xsl:when>
<xsl:otherwise>
   <xsl:element name="span">
            <xsl:attribute name="class">testo_lingua</xsl:attribute>
            <xsl:apply-templates />
    </xsl:element>
</xsl:otherwise>

</xsl:choose>
</xsl:template>

<!--CITAZIONI-->
<xsl:template match="tei:quote">
        <xsl:element name="span">
            <xsl:attribute name="class">quotes</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
</xsl:template>
<xsl:template match="tei:cit">
        <xsl:element name="span">
            <xsl:attribute name="class">citazioni</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
</xsl:template>


<!--ORGANIZZAZIONI-->
<xsl:template match="tei:orgName">
       <xsl:choose>
  <xsl:when test="@ref">

        <xsl:variable name="id" select="substring-after(@ref, '#')"  />
        
        <!-- Trova il link corrispondente utilizzando la chiave -->
        <xsl:variable name="link" select="key('org-by-id', $id)/tei:orgName/@ref" />  
          
            <xsl:element name="span">
             <xsl:attribute name="class">org</xsl:attribute>
             <a href="{ $link }">         
            <xsl:apply-templates />
            </a> 
              </xsl:element> 
    </xsl:when>
    <xsl:otherwise>
     <xsl:element name="span">
            <xsl:attribute name="class">org</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:otherwise>  
   </xsl:choose>       
</xsl:template>


</xsl:stylesheet>