package es.unizar.webeng.hello.controller

import es.unizar.webeng.hello.data.Greeting
import es.unizar.webeng.hello.repo.GreetingsRepo
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*

/**
 *  Controller class.
 *
 *  The annotation [Controller], which are means of attaching
 *  metadata to code.
 *  The responsbility ofthis class is to accept requests
 *  from the user, to interact with the model and to select
 *  the view for response.
 *
 *  original example: https://github.com/sreeharikv112/springbootrestapikt
 */
@RestController
class GreetingResource{

    @Autowired
    val greetingsRepo = GreetingsRepo()

    @GetMapping("/greeting")
    fun retrieveAllGreetings(): List<Greeting> {
        return greetingsRepo.retrieveAllGreetings()
    }

    @PostMapping("/addGreeting")
    fun post(@RequestBody greeting: Greeting): List<Greeting>{
        return greetingsRepo.addGreeting(greeting)
    }

    @GetMapping("/greeting/{lang}")
    fun retrieveGreetingByLanguage(@PathVariable lang: String): Greeting?{
        return greetingsRepo.getGreetingWithLanguage(lang)
    }

    @DeleteMapping("/deleteGreeting/{lang}")
    fun deleteGreeting(@PathVariable lang: String): List<Greeting>{
        return greetingsRepo.deleteGreeting(lang)
    }
}
