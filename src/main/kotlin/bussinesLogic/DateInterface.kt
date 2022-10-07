package es.unizar.webeng.hello.controller

/**
 *  Interface of date message creation business logic.
 *
 *  Date represents the time lapse between two dates, the current one
 *  and one given as a parameter
 */
interface Date {
    /**
     * @param endDate date to whitch you want to calculate
     * @param format date text format
     * @return String of how mane days are left till the end of the semester
     */
    fun calculateDaysLeft(endDate: String, format: String): String
}