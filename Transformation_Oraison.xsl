<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    <!-- Variables de noms des fichiers de sortie -->
    <xsl:variable name="home">
        <xsl:value-of select="concat('home','.','html')"/>
    </xsl:variable>
    
    <xsl:variable name="notice">
        <xsl:value-of select="concat('notice','.','html')"/>
    </xsl:variable>
    
    <xsl:variable name="transcription">
        <xsl:value-of select="concat('transcription','.','html')"/>
    </xsl:variable>
    
    <xsl:variable name="facsimile">
        <xsl:value-of select="concat('facsimile','.','html')"/>
    </xsl:variable>
    
    <xsl:variable name="index">
        <xsl:value-of select="concat('index','.','html')"/>
    </xsl:variable>
    
    <!-- Définition de la variable pour le header HTML -->
    <xsl:variable name="head">
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
            <link rel="stylesheet" href="style.css"/>
            <title>
                <xsl:text>Une </xsl:text>
                <xsl:value-of select="//titleStmt/title"/>
            </title>
            <meta name="author">
                <xsl:attribute name="content">
                    <xsl:value-of select="//respStmt/persName"/>
                </xsl:attribute>
            </meta>
            <meta name="description" content="Édition numérique de l'Oraison à Notre Dame de Christine de Pizan tirée du manuscrit français 12779 de la Bibliothèque nationale de France"/>
            <meta name="keywords" content="XSLT,XML,TEI,Pizan"/>
            <link rel="icon" type="image/jpg" href="../img/favicon.jpg"/>
        </head>
    </xsl:variable>
    
    <!-- Création de la variable pour la barre de navigation -->
    <xsl:variable name="navbar">
        <header>
            <nav class="navbar navbar-expand-md navbar-light bg-light">
                <a class="navbar-brand" href="{$home}">Accueil</a>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="{$notice}">Notice</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{$transcription}">Transcription</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{$facsimile}">Fac-similé</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{$index}">Index</a>
                    </li>
                </ul>
            </nav>
        </header>
        <!-- Bouton de retour en haut de la page -->
        <button type="button" class="btn" id="bouton_retour"><img src="../img/caret-up-fill.svg" alt="Flèche" width="15" height="25"/></button>
    </xsl:variable>
    
    <!-- Création d'une variable pour le footer -->
    <xsl:variable name="footer">
        <footer class="bg-light text-muted">
            <div class="container">
                <p class="p-3 mb-0">
                    <xsl:value-of select="//publicationStmt/publisher"/> © <xsl:value-of select="//respStmt/persName"/>, 2023
                </p>
            </div>
        </footer>
        <script src="script.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </xsl:variable>
    
    <!-- Match de la racine de notre document TEI avec les templates -->
    <xsl:template match="/">
        <xsl:call-template name="home"/>
        <xsl:call-template name="notice"/>
        <xsl:call-template name="transcription"/>
        <xsl:call-template name="facsimile"/>
        <xsl:call-template name="index"/>
    </xsl:template>
    
    <!-- Template pour la page d'accueil -->
    <xsl:template name="home">
        <xsl:result-document href="{$home}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <main class="container-fluid">
                        <!-- Bannière -->
                        <div class="row">
                            <div class="col-md-12" id="banniere">
                                <!-- Titre principal -->
                                <h1 class="text-light" id="titre">
                                    <xsl:value-of select="//titleStmt/title"/>
                                </h1>
                                <!-- Texte sur la bannière -->
                                <div class="texte_ban">Édition numérique d'une <xsl:value-of select="//titleStmt/title"/> de <xsl:value-of select="//titleStmt/author"/>, extraite du manuscrit <xsl:value-of select="//idno[@type='shelfmark']"/> de la <xsl:value-of select="//msDesc//institution"/>.</div>
                            </div>
                        </div>
                            
                        <!-- Texte de présentation du projet -->
                        <div class="row about">
                            <div class="col-md-10 offset-1 mt-3">
                                <p>Ce projet est une proposition d'encodage d'un texte poétique extrait du <i>Livre de Christine</i>, conservé à la Bibliothèque nationale de France (Français 12779) : l'Oraison à Notre-Dame prend la forme d'une prière adressée à la Vierge par Christine de Pizan. Dans ce texte en vers, l'autrice prie pour la protection du roi et du royaume de France. En pleine Guerre de Cent Ans, Christine de Pizan implore pour la protection de la famille du roi ; pour la reine, le dauphin, les oncles du roi et ses enfant, ainsi que pour le peuple français, et particulièrement pour les femmes.<br/>Cette oraison à la Vierge est riche de références aux Pères de l'Église dont les écrits ont porté sur la Vierge, et offre ainsi un regard sur son culte à travers l'histoire religieuse.<br/>
                                Ce site a été réalisé dans le cadre du cours de XML-TEI et de XSLT du Master 2 Technologies numériques appliquées à l'histoire de l'École des chartes. L'encodage XML-TEI du texte, la feuille de transformation XSL et les fichiers de sortie HTML sont disponible sur le <a href="https://github.com/jnorindr/Oraison_Pizan">dépôt GitHub</a> du projet.<br/>
                                Le manuscrit numérisé est consultable sur <a href="https://gallica.bnf.fr/ark:/12148/btv1b60001038">Gallica</a>.</p>
                            </div>
                        </div>
                    </main>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- Template pour la notice du manuscrit -->
    <xsl:template name="notice">
        <xsl:result-document href="{$notice}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <main class="container-fluid">
                        <h2 class="ml-4 offset-md-2 mt-4"><xsl:value-of select="//titleStmt/author"/>, <xsl:value-of select="//head/title"/> (<xsl:value-of select="//head/origDate"/>)</h2>
                        <div class="row">
                            <div class="col-md-8 offset-md-2 mt-2 mb-3 cadre">
                                <p>
                                    <b><xsl:value-of select="//institution"/>, <xsl:value-of select="//repository"/></b>
                                    <br/>
                                <b>Cote : </b> <xsl:value-of select="//idno[@type='shelfmark']"/><br/>
                                    <xsl:for-each select="//altIdentifier/idno"> 
                                        <xsl:value-of select="."/> (Ancienne cote)<br/>
                                    </xsl:for-each>
                                    <!-- Liens vers Gallica et Archives et manuscrits -->
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:text>https://gallica.bnf.fr/ark:/</xsl:text>
                                            <xsl:value-of select="//idno[@source='gallica']"/>
                                        </xsl:attribute>
                                        Voir le manuscrit sur Gallica
                                    </a> - 
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:text>https://archivesetmanuscrits.bnf.fr/ark:/</xsl:text>
                                            <xsl:value-of select="//idno[@source='catalog']"/>
                                        </xsl:attribute>
                                        Voir la notice sur BnF Archives et manuscrits
                                    </a>
                                </p>
                                
                                <hr/>
                                        
                                <h5>Sommaire</h5>
                                <!-- Sommaire à partir des éléments <locus> -->
                                <ul>
                                    <xsl:for-each select="//summary/locus">
                                        <xsl:choose>
                                            <xsl:when test="./@from='154a'">
                                                <li><b><xsl:value-of select="."/></b> (ff. <xsl:value-of select="./@from"/> - <xsl:value-of select="./@to"/>)</li>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <li><xsl:value-of select="."/> (ff. <xsl:value-of select="./@from"/> - <xsl:value-of select="./@to"/>)</li>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:for-each>
                                </ul>
                                <hr/>
                                <!-- Description matérielle à partir des informations du <physDesc> -->
                                <h5>Description matérielle</h5>
                                <p><u><xsl:value-of select="//support"/> :</u>
                                    <xsl:text> </xsl:text>
                                <xsl:value-of select="//foliation"/></p>
                                    
                                <p><xsl:value-of select="//layout"/></p>
                                <p><xsl:value-of select="//handNote/p"/><xsl:text> </xsl:text><xsl:value-of select="//scriptNote"/></p>
                                <p><u>Décor :</u>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="//decoDesc/decoNote[1]"/><br/>
                                <xsl:value-of select="//decoNote[@type='initial'][1]"/></p>
                                <p><u>Reliure :</u>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="//bindingDesc/decoNote"/><br/></p>
                                <hr/>
                                <!-- Historique du manuscrit à partir des informations de l'élément <history>-->
                                <h5>Historique</h5>
                                <p><xsl:value-of select="//origin/p"/></p>
                                <p><xsl:value-of select="//acquisition/p"/></p>
                                <hr/>
                                <!-- Bibliographie -->
                                <button type="button" class="biblio">Bibliographie</button>
                                <ol class="contenu_biblio">
                                    <xsl:for-each select="//listBibl/bibl">
                                        <li>
                                            <p>
                                                <xsl:if test="./author">
                                                    <xsl:for-each select="./author">
                                                        <xsl:value-of select="."/>, 
                                                    </xsl:for-each>
                                                </xsl:if>
                                                <xsl:if test="./editor">
                                                    <xsl:value-of select="./editor"/>, 
                                                </xsl:if>
                                                <xsl:if test="./title/@level='a'">
                                                    &#171; <xsl:value-of select="./title[@level='a']"/> &#187;, 
                                                </xsl:if>
                                                <xsl:choose>
                                                    <xsl:when test="./title/@level='m'">
                                                        <i><xsl:value-of select="./title[@level='m']"/></i>,  
                                                    </xsl:when>
                                                    <xsl:when test="./title">
                                                        <i><xsl:value-of select="./title"/></i>,  
                                                    </xsl:when>
                                                </xsl:choose>
                                                <xsl:if test="./publisher">
                                                    <xsl:value-of select="./pubPlace"/> : <xsl:value-of select="./publisher"/>,
                                                </xsl:if>
                                                <xsl:if test="./date">
                                                    <xsl:choose>
                                                        <xsl:when test="./date[@when]">
                                                            <xsl:value-of select="./date/@when"/>, 
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="./date"/>, 
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:if>
                                                <xsl:if test="./biblScope[@unit='volume']">
                                                    <xsl:for-each select="./biblScope[@unit='volume']">
                                                        <xsl:value-of select="."/>, 
                                                    </xsl:for-each>
                                                </xsl:if>
                                                <xsl:if test="./biblScope[@unit='issue']">
                                                    n° <xsl:value-of select="./biblScope[@unit='issue']"/>, 
                                                </xsl:if>
                                                <xsl:if test="./biblScope[@unit='page']">
                                                    <xsl:for-each select="./biblScope[@unit='page']">
                                                        <xsl:value-of select="."/>
                                                        <xsl:if test="position()!=last()">, </xsl:if>
                                                        <xsl:if test="position()=last()">.</xsl:if>
                                                    </xsl:for-each>
                                                </xsl:if>
                                            </p>
                                        </li>
                                    </xsl:for-each>
                                </ol>
                            </div>
                        </div>
                    </main>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Template pour la transcription -->
    <xsl:template name="transcription">
        <xsl:result-document href="{$transcription}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <main class="container-fluid">
                        <div class="row mt-3">
                            <!-- Séparation de deux versions du texte selon les éléments <choice> de l'édition TEI -->
                            <div class="col-md-4 offset-2 transc">
                                <h4>Transcription diplomatique</h4>
                                <p>
                                    <xsl:apply-templates select="//body/lg" mode="transcr-diplo"/>
                                </p>
                            </div>
                            <div class="col-md-4 transc">
                                <h4>Transcription modernisée</h4>
                                <p>
                                    <xsl:apply-templates select="//body/lg" mode="transcr-mod"/>
                                </p>
                            </div>
                        </div>
                    </main>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Élements à exclure de la transcription diplomatique -->
    <xsl:template match="expan | reg" mode="transcr-diplo"/>
    
    <!-- Règles pour la transcription diplomatique -->
    <xsl:template match="//lg/head" mode="transcr-diplo">
        <span class="rouge">
            <xsl:apply-templates mode="transcr-diplo"/>
        </span>
        <br/>
    </xsl:template>
    
    <xsl:template match="//lg/l" mode="transcr-diplo">
        <!-- Numéros de ligne -->
        <xsl:if test="number(replace(./@facs, '#l', '')) mod 5 = 0">
            <span class="num_ligne">
                <xsl:value-of select="replace(./@facs, '#l', '')"/>
            </span>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="./fw[@rend='color:red']">
                <span class="avemaria">
                    <xsl:apply-templates mode="transcr-diplo"/>
                </span>
                <br/>
            </xsl:when>
            <xsl:when test="./fw[@place='centred']">
                <span class="amen">
                    - <xsl:apply-templates mode="transcr-diplo"/> -
                </span>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates mode="transcr-diplo"/><br/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="//lg/l/g" mode="transcr-diplo">
        <xsl:choose>
            <xsl:when test=".[@rend='color:red']">
                <span class="rouge" style="font-weight:bold">
                    <xsl:apply-templates mode="transcr-diplo"/>
                </span>
            </xsl:when>
            <xsl:when test=".[@rend='color:blue']">
                <span class="bleu" style="font-weight:bold">
                    <xsl:apply-templates mode="transcr-diplo"/>
                </span>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="//l/persName | rs" mode="transcr-diplo">
        <span class="name">
            <xsl:apply-templates mode="transcr-diplo"/>
        </span>
    </xsl:template>
    
    <!-- Élements à exclure de la transcription modernisée -->
    <xsl:template match="abbr | orig" mode="transcr-mod"/>
    
    <!-- Règles pour la transcription modernisée -->
    <xsl:template match="//lg/head" mode="transcr-mod">
        <span class="rouge">
            <xsl:apply-templates mode="transcr-mod"/>
        </span>
        <br/>
    </xsl:template>
    
    <xsl:template match="//lg/l" mode="transcr-mod">
        <!-- Numéros de ligne -->
        <xsl:if test="number(replace(./@facs, '#l', '')) mod 5 = 0">
            <span class="num_ligne">
                <xsl:value-of select="replace(./@facs, '#l', '')"/>
            </span>
        </xsl:if>
        <xsl:choose>
            <!-- Refrains -->
            <xsl:when test="./fw[@rend='color:red']">
                <span class="avemaria">
                    <xsl:apply-templates mode="transcr-mod"/>
                </span>
                <br/>
            </xsl:when>
            <xsl:when test="./fw[@place='centred']">
                <span class="amen">
                    - <xsl:apply-templates mode="transcr-mod"/> -
                </span>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates mode="transcr-mod"/><br/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="//lg/l/g" mode="transcr-mod">
        <xsl:choose>
            <xsl:when test=".[@rend='color:red']">
                <span class="rouge" style="font-weight:bold">
                    <xsl:apply-templates  mode="transcr-mod"/>
                </span>
            </xsl:when>
            <xsl:when test=".[@rend='color:blue']">
                <span class="bleu" style="font-weight:bold">
                    <xsl:apply-templates  mode="transcr-mod"/>
                </span>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="//l/persName | rs" mode="transcr-mod">
        <span class="name">
            <xsl:apply-templates mode="transcr-mod"/>
        </span>
    </xsl:template>
    
    <!-- Création du fac-similé interactif avec la transcription modernisée -->
    <xsl:template name="facsimile">
        <xsl:result-document href="{$facsimile}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <main class="container-fluid">
                        
                        <!-- Pour chaque image (balises <graphic>) -->
                       <xsl:for-each select="//surface/graphic">
                           <!-- Déclaration de la variable folio -->
                           <xsl:variable name="fol">
                               <xsl:value-of select="//pb[@n=replace(current()/@url, 'img/Oraison_', '')]/@n"/>
                           </xsl:variable>
                           <div class="row mt-3 offset-1">
                               <!-- Titre à partir du numéro de folio -->
                               <h4>
                                   <xsl:attribute name="id">
                                       <xsl:copy-of select="$fol"/>
                                   </xsl:attribute>
                                   Folio <xsl:copy-of select="$fol"/>
                               </h4>
                               <hr/>
                               <!-- Image de base du fac-similé -->
                                <div class="img_facsim">
                                    <xsl:attribute name="style">
                                        <xsl:text>background-image: url(&quot;../</xsl:text>
                                        <xsl:value-of select="./@url"/>
                                        <xsl:text>.jpeg&quot;);</xsl:text>
                                        <xsl:text>width:</xsl:text>
                                        <xsl:value-of select="./@width"/>
                                        <xsl:text>;height:</xsl:text>
                                        <xsl:value-of select="./@height"/>
                                        <xsl:text>;</xsl:text>
                                    </xsl:attribute>
                                    
                                <!-- Bulles de texte : position et dimensions calculées à partir des @ coordonnées et alignement avec l'@facs -->
                                    <xsl:for-each select="parent::surface/zone">
                                            <div class="bulle_facsim">
                                                <xsl:attribute name="style">
                                                    <xsl:value-of select="concat('top:', ./@uly, 'px;left:', ./@ulx, 'px;width:',number(@lrx)-number(@ulx),'px;height:', number(@lry)-number(@uly), 'px;')"/>
                                                </xsl:attribute>
                                            <div>
                                                <xsl:apply-templates select="//*[@facs=concat('#', current()/@xml:id)]" mode="transcr-facs"/>
                                            </div>
                                        </div>
                                    </xsl:for-each>
                                </div>
                           </div>
                       </xsl:for-each>
                    </main>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Règles pour la transcription fac-similé -->
    <xsl:template match="orig" mode="transcr-facs"/>
    
    <xsl:template match="//lg/l|head" mode="transcr-facs">
        <xsl:apply-templates mode="transcr-facs"/>
    </xsl:template>
    <xsl:template match="expan" mode="transcr-facs">
        <span class="abb">
            <xsl:text>(</xsl:text>
            <xsl:apply-templates mode="transcr-facs"/>
            <xsl:text>)</xsl:text>
        </span>
    </xsl:template>
    
    <!-- Création de l'index -->
    <xsl:template name="index">
        <xsl:result-document href="{$index}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <main class="container-fluid">
                        <div class="row mt-3 mb-3">
                            <h2 class="offset-2">Index des noms</h2>
                            <div class="col-md-8 offset-2 cadre">
                                <!-- Groupes pour les entrées d'index -->
                                <xsl:for-each-group select="//listPerson/person" group-by="@xml:id">
                                    <!-- Entrées à partir de la liste des noms définie dans le <teiHeader>-->
                                    <h5>
                                        <xsl:for-each select="./persName">
                                            <xsl:value-of select="."/>
                                            <xsl:if test="position()!=last()">, 
                                            </xsl:if>
                                        </xsl:for-each>
                                    </h5>
                                    <hr/>
                                    <p>
                                        <xsl:value-of select="./note"/>
                                    </p>
                                    <!-- Récupération de chaque mention et de son numéro de ligne -->
                                    <p class="index">
                                        <!-- Création de groupes pour éviter les répétitions -->
                                        <xsl:for-each-group select="//l//persName[@ref=current()/concat('#', @xml:id)]" group-by=".">
                                            <xsl:apply-templates mode="transcr-diplo"/>
                                            <!-- Numéros de ligne pour chaque membre du groupe -->
                                            <xsl:text> (l. </xsl:text>
                                            <xsl:for-each select="current-group()">
                                                <xsl:value-of select="replace(ancestor::l/@facs, '#l', '')"/>
                                                <xsl:if test="position()!=last()">, </xsl:if>
                                            </xsl:for-each>
                                            <xsl:text>)</xsl:text>
                                            <xsl:if test="position()!=last()">, </xsl:if>
                                            <xsl:if test="position()=last()">.<br/></xsl:if>
                                        </xsl:for-each-group>
                                        <!-- Création de groupes pour éviter les répétitions -->
                                        <xsl:for-each-group select="//l/rs[@ref=current()/concat('#', @xml:id)]" group-by=".">
                                            <xsl:apply-templates mode="transcr-diplo"/>
                                            <!-- Numéros de ligne pour chaque membre du groupe -->
                                            <xsl:text> (l. </xsl:text>
                                            <xsl:for-each select="current-group()">
                                                <xsl:value-of select="replace(parent::l/@facs, '#l', '')"/>
                                                <xsl:if test="position()!=last()">, </xsl:if>
                                            </xsl:for-each>
                                            <xsl:text>)</xsl:text>
                                            <xsl:if test="position()!=last()">, </xsl:if>
                                            <xsl:if test="position()=last()">.</xsl:if>
                                        </xsl:for-each-group>
                                    </p>
                                </xsl:for-each-group>
                            </div>
                        </div>
                    </main>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>