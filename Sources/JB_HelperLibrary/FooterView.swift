// FooterView
public struct FooterView: View {
    public var body: some View {
        Spacer()
        HStack{
            Text("© \(Calendar.current.component(.year, from: Date())) @jurgenbert")
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color.black)
                .padding()
                .background(Color.accentColor)
                .font(.title3)
        }
    }
}
