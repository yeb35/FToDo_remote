
import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Task")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form{
                // Title
                TextField("Task Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //Current time

                DatePicker("Create Date", selection: $viewModel.createdDate)
                    
                
                // Due date
                VStack{
                    Text("Due Date")
                        .bold()
                    DatePicker("Due Date", selection: $viewModel.dueDate)
                        .datePickerStyle(GraphicalDatePickerStyle())
                    // .datePickerStyle(DateInterval(start: Date, end: Date))}
                }
                
                
                // Button
                TLButton(title: "Save", background: .pink){
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }else{
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert){
                    Alert(title: Text("Error"), message: Text("Please fill in all fields"))
            }
            
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: {
            _ in
        }))
    }
}
