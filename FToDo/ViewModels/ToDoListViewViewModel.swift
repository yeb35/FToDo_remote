import FirebaseFirestore
import Foundation
// viewmodel for list of items views
// primary tab

class ToDoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    /// Delete to do list item
    /// - Parameter id: item id to delete
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
