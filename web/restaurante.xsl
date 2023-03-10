<?xml version="1.0" encoding="utf-8"?>

<!--LMSGI04 - Tarea Evaluativa 02 - XSLT
	Autor: Xabier Lasa Oliver
	Autoevaluación:
	https://docs.google.com/document/d/1H9OozjMVZ7M5i1ufSEY7Tgo9RNYR7Bh-6Bb0l90JiPk/edit?usp=sharing 
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-doctype" />

<!--Plantilla festival. Intercalamos código HTML con datos XML. En esta hoja trabajamos con rutas relativas y una sola plantilla para todo el contenido 
	ya que se debe mostrar como una jerarquía de niveles-->
<xsl:template match="/" >

	<html lang="es">

		<head>
			<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
			<meta charset="utf-8"/>
			<meta name="description" content="Página principal" />
			<title>titulo de la web</title>
		</head>

		<body>
			<header>
				<img src= "../img/logotipo.png" alt= "Reservas" />
				<a href="teatro.xml">Teatro</a>
				<a href="restaurante.xml">Restaurante</a>
				<a href="festival.xml">Festival</a>
			</header>
			
			<main>
				<!-- For-each para empezar a mostrar los resultado para cada restaurante desde el nombre -->
				<xsl:for-each select="//restaurante">

					<!--Variable con el nombre del restaurante para localizar en el link sus atributos y mostrarlos mediante expresiones xPath-->
					<xsl:variable name="nomRest" select="//restaurante/nombrerestaurante"/>
					<h1><a href="{//restaurante[nombrerestaurante=$nomRest]/informacion}" target="blank"><xsl:value-of select="//restaurante[nombrerestaurante=$nomRest]/nombrerestaurante"/> - <xsl:value-of select="//restaurante[nombrerestaurante=$nomRest]/ciudad"/></a></h1>
					
					<!-- For-each para cada tipo de menu y que se muestre en el encabezado del artículo -->
					<xsl:for-each select="menu">
						<article class="restaurante">
							<h3><xsl:value-of select="@tipo"/></h3>

							<!-- For-each para listar los platos de cada menú en lista-->
							<xsl:for-each select="plato">
								<p><xsl:value-of select="."/></p>
							</xsl:for-each>
						</article>
					</xsl:for-each>
				</xsl:for-each>
			</main>

			<footer>
				<address>&#169; 2020 desarrollado por info@birt.eus</address>
			</footer>
		</body>
	</html>

</xsl:template>
</xsl:stylesheet>
