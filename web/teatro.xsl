<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-doctype" />

<!--Plantilla festival. Intercalamos código HTML con datos XMLEn esta hoja trabajamos con rutas relativas y una sola plantilla para todo el contenido 
	ya que se debe mostrar una sola lista-->
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
			
			<main class="principal">
				<section class="teatro">
					<h1>PROXIMAS OBRAS DE TEATRO</h1>
					<ul>
						<!-- For-each para listar las obras -->
						<xsl:for-each select="//teatro">

							<!-- Se ordenan por fecha de forma descendente -->
							<xsl:sort select="fechahora/@dia" order="descending"/>

							<!-- Se testean las obras con precio inferiror a 20€ para que se muestren subrayadas-->
							<xsl:if test="precio&lt;20">
								<li><u><xsl:value-of select="fechahora/@dia"/>:  <xsl:value-of select="obra"/></u></li>
							</xsl:if>
							
							<!-- Se testean el resto de las obras (no inferiores a 20€ para que se muestren sin subrayar y aparezcan todas-->
							<xsl:if test="precio>=20">
								<li><xsl:value-of select="fechahora/@dia"/>:  <xsl:value-of select="obra"/></li>
							</xsl:if>

							<!-- Hay otra forma de hacerlo y es utilizar xsl:choose en lugar de if pero he utilizado el testeo con if porque es un 
								copia/pega más sencillo y rápido a la hora de programarlo  y la diferencia, en este caso, no aporta economía de líneas -->
						</xsl:for-each>
					</ul>
				</section>
			</main>

			<footer>
				<address>&#169; 2020 desarrollado por info@birt.eus</address>
			</footer>
		</body>
	</html>

</xsl:template>
</xsl:stylesheet>