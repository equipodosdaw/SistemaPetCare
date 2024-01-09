# PetCare

### Desarrollado con:

<table align="center">
    <td align="center"  width="96">
        <img src="https://skillicons.dev/icons?i=html" width="48" height="48" alt="HTML5" />
      <br>HTML5
    </td>
    <td align="center" width="96">
        <img src="https://skillicons.dev/icons?i=css" width="48" height="48" alt="css" />
      <br>CSS
    </td>
    <td align="center"  width="96">
        <img src="https://skillicons.dev/icons?i=bootstrap" width="48" height="48" alt="bootstrap" />
      <br>Bootstrap
    </td>
      <td align="center" width="96">
        <img src="https://skillicons.dev/icons?i=java" width="48" height="48" alt="Java" />
      <br>Java
    </td>
         <td align="center" width="96">
        <img src="https://techstack-generator.vercel.app/mysql-icon.svg" alt="icon" width="65" height="65" />
      <br>MySQL
    </td>
      </td>
 </tr>
</table>
<br><br>
</tr>
</tr></tr>

## Instalación del proyecto

### Opción 1

Ejecutar el siguente comando en la terminal con git:
```bash
git clone git@github.com:equipodosdaw/SistemaPetCare.git
```
>[!IMPORTANT]
Tienes que tener una clave SSH en tu cuenta de github. [Cómo hacerlo](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

### Opción 2
Descargar como archivo zip el proyecto dando click a [<>Code] y despues a Download ZIP en el repositorio de github.

Una vez descargado hay que descomprimirlo.

## Preparacion del proyecto

1. Debe de asignar el servidor [Apache Tomcat](https://tomcat.apache.org/download-90.cgi) <a href="https://tomcat.apache.org/download-90.cgi" target="_blank" ><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Apache_Tomcat_logo.svg/2560px-Apache_Tomcat_logo.svg.png" alt="Tomcat" width="30" height="25" /></a> en [NeatBeans](https://netbeans.apache.org/front/main/download/archive/) <a href="https://netbeans.apache.org/front/main/download/archive/" target="_blank" ><img src="https://img.icons8.com/?size=48&id=4djt356tq8UO&format=png" alt="netbeans" width="25" height="25" /></a>.
2. Abrir el proyecto con el ide [NeatBeans](https://netbeans.apache.org/front/main/download/archive/) <a href="https://netbeans.apache.org/front/main/download/archive/" target="_blank" ><img src="https://img.icons8.com/?size=48&id=4djt356tq8UO&format=png" alt="netbeans" width="25" height="25" /></a>

>[!WARNING]
>El proyecto esta desarrollado en la version 17 de NeatBeans y [Java SE 8](https://www.oracle.com/es/java/technologies/javase/javase8-archive-downloads.html) <a href="https://www.oracle.com/es/java/technologies/javase/javase8-archive-downloads.html" target="_blank" ><img src="https://cdn-icons-png.flaticon.com/256/226/226777.png" alt="Java" width="30" height="30" /></a>


3. Dar a "Resolve Problems..." o click derecho en el proyecto y click en "Resolve Reference Problems...", luego a "Resolve..." donde hay que asignar el archivo mysql-connector-j-8.0.33.jar situado en build\web\WEB-INF\lib\

<img src="https://lh3.googleusercontent.com/drive-viewer/AEYmBYRkoRtl4CivcONeGl40cGSqFoKlKfz_HyhYSBoYHgHQReKc-AVAjOvVxKRKXtO9Dx79nr5y9Kg6jiVABbwk8Yed9qXxig=w1900-h900" alt="IMGProblem" />

>[!CAUTION]
>Ademas de este puede haber un problema con la version de Java, el proyecto esta desarrollado con la version [Java SE 8](https://www.oracle.com/es/java/technologies/javase/javase8-archive-downloads.html) <a href="https://www.oracle.com/es/java/technologies/javase/javase8-archive-downloads.html" target="_blank" ><img src="https://cdn-icons-png.flaticon.com/256/226/226777.png" alt="Java" width="30" height="30" /></a>.

4. Iniciar [XAMP](https://www.apachefriends.org/es/download.html) <a href="https://www.apachefriends.org/es/download.html" target="_blank" ><img src="https://branditechture.agency/brand-logos/wp-content/uploads/wpdm-cache/XAMPP-900x0.png" alt="XAMP" width="35" height="30" /></a>, una vez abierto inicia MySQL.
5. De vuelta en NetBeans Click en "Run Project" o pulsa F6 .
