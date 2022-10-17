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

    <!-- The value of the message will change as the script bellow is executed -->
    <div class="col-lg-6 mx-auto">
        <p id="message">HOLA</p>
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

<!-- As we have no longer the MVC, we have to get the value of message.
In order to do that, we have to make a request to the endpoint `/rest/message`
The response will be the value of the message, and then we will assign that to the html -->

<!-- We are going to use axios, import the right lib so our browser can use it -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
    let message = document.getElementById("message")
    axios.get("http://localhost:8080/rest/message")
    .then(response => {
        console.log("Response: " + response.data)
        message.innerText = response.data
    })
    .catch(err => {
        console.log("Fatal error: ", err)
    })
</script>

</body>
</html>
