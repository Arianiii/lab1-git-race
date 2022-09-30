package es.unizar.webeng.hello.repo

import es.unizar.webeng.hello.data.Greeting
import org.springframework.stereotype.Repository

/**
 * Repository class for connecting to database.
 * For demostration used local variable as list of greetings
 * code modified from original example: https://github.com/sreeharikv112/springbootrestapikt
 */


@Repository
class GreetingsRepo {

    var mAllGreetings = mutableListOf<Greeting>()

    init {
        val g1 = Greeting("es","Hola!")
        val g2 = Greeting("en","Hello!")
        val g3 = Greeting("fr","Bonjour!")
        val g4 = Greeting("ru","Privet!")

        mAllGreetings.add(g1)
        mAllGreetings.add(g2)
        mAllGreetings.add(g3)
        mAllGreetings.add(g4)
    }

    /**
     * Retrieve all greetings.
     */
    fun retrieveAllGreetings(): List<Greeting>{
        return mAllGreetings
    }

    /**
     * Adding new greeting.
     */
    fun addGreeting(newGreeting:Greeting): List<Greeting>{

        mAllGreetings.add(newGreeting)

        return mAllGreetings
    }

    /**
     *  Get greeting with language.
     */
    fun getGreetingWithLanguage(lang:String): Greeting?{

        return findGreetingByLanguage(lang)

    }

    /**
     * Delete greeting by language.
     */
    fun deleteGreeting(lang:String): List<Greeting>{

        var greeting: Greeting? = findGreetingByLanguage(lang)
        mAllGreetings.remove(greeting)

        return mAllGreetings
    }

    /**
     * Find greeting by language.
     */
    fun findGreetingByLanguage(lang:String): Greeting?{
        return mAllGreetings.find{it.lang == lang}
    }
}