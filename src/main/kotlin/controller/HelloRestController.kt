package es.unizar.webeng.hello.controller

import org.springframework.beans.factory.annotation.Value
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.bind.annotation.GetMapping

/**
 *  RestController class.
 *  
 *  Basically, RestController is the union of classes Controller and
 *  ResponseBody. Basically, with the ResponseBody, we can return
 *  a response.
 */

@RestController
class HelloRestController {

    /**
     *  The value parameter is a special case in which
     *  its value can be specified without an explicit
     *  name. In this case, the value given to this
     *  parameter is the content of the app.message.
     *  This message is located at /resources/application.properties
     *  and contains the text "Hola estudiante".
     */
    @Value("\${app.message}")
    private var message: String = "Hello World"

    @GetMapping("/rest/message")
    fun getMessage(): ResponseEntity<String> {
        return ResponseEntity<String>(message, HttpStatus.OK)
    }
}
