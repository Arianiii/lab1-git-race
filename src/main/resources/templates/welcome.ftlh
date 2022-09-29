<!-- In the ftlh file welcome we write the code used for structure and display the web page and the content.-->
<!DOCTYPE html>

<!-- FreeMarker documentation: https://freemarker.apache.org
FreeMarker is used as markup template language.
FreeMarker templates work like HTML, allows prototyping without running the app.-->
<html lang="en" xmlns="https://freemarker.apache.org">

<!-- Head element gives general information about the web,
which does not appear on the page, only in the tab and
contains the tittle of the page "Hello world". -->
<head>
    <title>Hello world</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
          rel="stylesheet"
          crossorigin="anonymous">
</head>

<!-- Body element is unique and represent the content of the web in a HTMl document.-->
<body>
<div class="px-4 py-5 my-5 text-center">
    <!-- Img element represent an image on the document.
         The class attribute is used to point a name in the style sheet chose on th head
         ("https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css").
         Scr contains the image to show on th web, which is found on /assets folder. -->
    <img class="d-block mx-auto mb-4" src="/assets/logo.svg" alt="">
    <!-- h1 element is used as the most important header in the document. -->
    <h1 class="display-5 fw-bold">My first Web App</h1>
    <!-- Div element is used to create group of content.
         P label is used to introduce text on the document.
         "${message}" is using app.message from application.properties.

	The next piece of information is related to the
	META-INF/additional-spring-configuration-metadata.json file but is
	added here because it's not possible to write comments in a JSON file.

	 In the META-INF folder there is a configuration metadata file and it's
	 written in a JSON format. The file contains a 'property', which is a
	 configuration item that the user specifies with a given value. In this
	 case, the name of the property is  app.message (this attribute is
	 mandatory) and its value is specified in the application.properties
	 file ('Hola estudiante'). The attribute 'type' specifies the full signature of the data type of the
	 property (in this case the value of the property must be a String) . Finally, the description attribute
	 provides a short description of the property that can be displayed to users.
    -->
    <div class="col-lg-6 mx-auto">
        <p class="lead mb-4"> ${message!"Hello student."}</p>
    </div>

    <div class="col-lg-6 mx-auto">
            <!-- Button tag is used to create a clickable button on a webpage. Once it's
                 clicked, then performs a programmable action. For example
                 here calls a function called 'request'
            -->
            <button type="button" onclick="request()">Buenos días</button>
            <div id="date"></div>
        </div>
</div>

<!-- Webjars documentation: https://www.webjars.org/
Webjars are client-side web libraries packaged into java archive files.
Webjars allows to manage this client-side dependencies in web applications, and can be used with the build tool gradle.
With this script element Bootstrap is available on the project and can be used on the application.-->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"
        crossorigin="anonymous"></script>

<!-- AJAX allows web pages to be updated asynchronously by exchanging data with a web
     server without reloading the whole page.
     AJAX uses a XMLHttpRequest object to request data from a web server.

     The XMLHttpRequest object can be used to exchange data with a web server behind
     the scenes. This means that it's possible to update parts of a web page, without
     reloading the whole page.

     A callback function is a function passed as a parameter to another function. It
     contains the code to execute when the response is ready. In this case the server
     returns an HTTP response with a status, if it's a 200 code, 'getElementById' looks
     for the id 'date' and then update the HTML code with the server response of its div
     group.

     'open' and 'send' to send the request to the server. It doesn't matter that 'send'
     is after the callback declaration, it's an asynchronous call.
-->
<script type="text/javascript">
    function request() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("date").innerHTML = this.responseText;
            }
        };
        xhttp.open('GET', 'http://localhost:8080/date', true);
        xhttp.send();
    }
</script>
</body>
</html>
