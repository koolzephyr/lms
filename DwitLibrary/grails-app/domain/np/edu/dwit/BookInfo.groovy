package np.edu.dwit

/**
 * Created by zephyr on 11/8/15.
 */
class BookInfo {
    Book book
    String bookNumber
    String edition
    String publishedYear
    String pages
    Double cost
    String source

    static constraints = {
        book blank: false, nullable: false
        bookNumber blank: false, nullable: false
        edition blank: false, nullable: false
        publishedYear blank: false, nullable: false
        pages blank: false, nullable: false
        cost blank:false, nullable: false
        source blank: false, nullable: false
    }
    static mapping = {
        version false
    }
}
