import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewModel()
    let item: ToDoListItem
    
    var body: some View {
        
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.title)
                
                Text("Created Date \(Date(timeIntervalSince1970: item.createdDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                    
                Text("Due Date\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item: item)
            }label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(
            id: "123",
            title: "Get job",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false))
    }
}
