<%-- 
    Document   : index
    Created on : 26/02/2025, 02:44:17 PM
    Author     : luisa
--%>
<%@ page import="javax.xml.parsers.DocumentBuilder, javax.xml.parsers.DocumentBuilderFactory, org.w3c.dom.*" %>
<%@ page import="java.io.File" %>


<%
//declaracion de procesos del documento XML
    try {//inicia tratamiento de errores
        String xmlPath = application.getRealPath("/WEB-INF/imagenes.xml"); // Ruta del archivo XML
        File xmlFile = new File(xmlPath);//integracion de intercambio de datos archivo web dinamico

        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();// produccion de instancias XML 
        DocumentBuilder builder = factory.newDocumentBuilder();//Integración y construcción de datos XML 
        Document document = builder.parse(xmlFile);//generación de documento web apartir de XML 
        document.getDocumentElement().normalize();//normalización de documentos 

        NodeList nodeList = document.getElementsByTagName("imagen"); //generacion de nodos en lista para cada item llamado imagen


%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page Apicacion web dinamica De Santiago</title>
    </head>
    <body style="background-color: darkseagreen">
    <center>
        <h1>Apicacion web dinamica De Santiago</h1>
        <ul><!-- Inicia lista uniforme -->
            <%                for (int i = 0; i < nodeList.getLength(); i++) { //inica for
                    Node node = nodeList.item(i);//llamamos a la lista para colocar los items.
                    if (node.getNodeType() == Node.ELEMENT_NODE) {//Inicia if
                        Element element = (Element) node;
                        String nombre = element.getElementsByTagName("nombre").item(0).getTextContent();
                        String ruta = element.getElementsByTagName("ruta").item(0).getTextContent();
                        String precio = element.getElementsByTagName("precio").item(0).getTextContent();
            %>
            
            <li><!-- Elementos de la lista -->
            <center>
                <p><strong><%=nombre%></strong></p>
                <img src="<%=ruta%>" alt="<%=nombre%>" width="200"/> 
                <p><strong><%=precio%></strong></p>
            </center>
                
            </li><!-- Terminana los elementos de la lista -->

            <%
                    }//termina if 
                }//termina for
            %>
        </ul><!-- Termina lista uniforme -->
    </center>
</body>
</html>
<%    } catch (Exception e) {
        out.println("Error al procesar el XML:" + e.getMessage());
    }

%>
