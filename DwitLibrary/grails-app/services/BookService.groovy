

import grails.transaction.Transactional
import np.edu.dwit.Book
import np.edu.dwit.Borrow

@Transactional
class BookService {

    def getBooksWithBorrowCount() {

        Map sortedBooksWithBorrowCount = new HashMap()

        for (Book book: Book.all)
            sortedBooksWithBorrowCount.put(book, Borrow.countByBook(book))

        new ValueComparator(sortedBooksWithBorrowCount);

        return sortedBooksWithBorrowCount
    }
}

class ValueComparator implements Comparator {
    Map base;

    public ValueComparator(Map base) {
        this.base = base;
    }

    // Note: this comparator imposes orderings that are inconsistent with
    // equals.
    public int compare(Object a, Object b) {
        if (base.get(a) >= base.get(b)) {
            return -1;
        } else {
            return 1;
        } // returning 0 would merge keys
    }
}
