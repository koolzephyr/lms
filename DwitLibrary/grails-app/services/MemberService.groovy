

import grails.transaction.Transactional
import np.edu.dwit.Borrow
import np.edu.dwit.Fine
import np.edu.dwit.Member

@Transactional
class MemberService {

    def getHistory(Member member) {


        def borrowedBooks = Borrow.findAllByMemberAndReturned(member, true);
        def fines = Fine.findAllByBorrowInList(borrowedBooks);

        Map<Borrow, Double> history = new HashMap<>()

        for (int i = 0; i < borrowedBooks.size(); i++){

            Borrow borrow = borrowedBooks.get(i)
            Fine fine
            try {
                fine = fines.get(i)
                history.put(borrow, fine.fineAmount)
            }catch(IndexOutOfBoundsException e) {
                history.put(borrow, null)
            }
        }

        return history
    }
}
