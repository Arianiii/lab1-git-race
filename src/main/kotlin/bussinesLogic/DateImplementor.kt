package es.unizar.webeng.hello.controller

import java.text.SimpleDateFormat

/**
 *  Implementor of [Date] interface
 */
class DateImplementor: Date{
    /**
     * @param endDate date to whitch you want to calculate
     * @param format date text format
     * @return how many days are left till [endDate]
     */
    fun calculateDays(endDate: String, format: String): Long{
        val finalFormat = SimpleDateFormat(format)
        val end = finalFormat.parse(endDate)
        val milliseconds = end.time - System.currentTimeMillis()
        val days = (milliseconds / (1000 * 3600 * 24))
        return days
    }

    /**
     * @param endDate date to whitch you want to calculate
     * @param format date text format
     * @return how many weeks are left till [endDate]
     */
    fun calculateWeeks(endDate: String, format: String): Long{
        val finalFormat = SimpleDateFormat(format)
        val end = finalFormat.parse(endDate)
        val milliseconds = end.time - System.currentTimeMillis()
        val weeks = (milliseconds / (1000 * 3600 * 24)).div(7)
        return weeks
    }

    /**
     * Implementation of the [Date] interface method
     *
     * [override] allows a subclass or child class to provide a specific implementation
     * of a method that is already provided by one of its super-classes or parent clases
     *
     * @param endDate date to whitch you want to calculate
     * @param format date text format
     * @return String of how mane days are left till the end of the semester
     */
    override fun calculateDaysLeft(endDate: String, format: String): String{
        val days = calculateDays(endDate, format)
        val weeks = calculateWeeks(endDate, format)
        return "Quedan " + weeks + " semanas y " + days % 7 + " días de cuatrimestre"
    }
}