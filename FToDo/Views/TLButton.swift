import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button{
            //Action
            action()
            
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
        .padding()
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Value",
                 background: .green){
            //Action
        }
    }
}
