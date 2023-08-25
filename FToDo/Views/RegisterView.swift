import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            //Header
            HeaderView(title: "Register",
                       subtitle: "Start Organizing Todo",
                       angle: -20,
                       background: .orange)
            
            Form{
                TextField("Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Surname", text: $viewModel.surname)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                
                TextField("Role", text: $viewModel.role)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Phone Number", text: $viewModel.phoneNumber)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("About yourself max 3096 character", text: $viewModel.resume)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocorrectionDisabled()
                            .frame(minHeight: 50)
                        .padding()
              
                TLButton(title: "Create an Account",
                         background: .green)
                {
                    viewModel.register()
                    //Attempt Registration
                }
                
                .padding()
            }
            .offset(y: -150)
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
