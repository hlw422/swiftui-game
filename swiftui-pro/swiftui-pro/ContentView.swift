import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    @State private var account = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 24) {
            // 账户输入框
            VStack(alignment: .leading) {
                Text("账户")
                    .font(.headline)
                    .foregroundColor(.gray)
                TextField("请输入账户名", text: $account)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.vertical, 8)
                    .frame(height: 44)
            }
            .padding(.horizontal)
            
            // 密码输入框
            VStack(alignment: .leading) {
                Text("密码")
                    .font(.headline)
                    .foregroundColor(.gray)
                SecureField("请输入密码", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.vertical, 8)
                    .frame(height: 44)
            }
            .padding(.horizontal)
            
            // 登录按钮
            Button(action: {
                showingAlert = true
            }) {
                Text("登录")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .alert("登录成功", isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    showingAlert = false
                }
            }
            .padding(.horizontal)
            
        }
        .padding(.top, 40)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 10)
        .padding()
    }
}

#Preview {
    ContentView()
}
