public struct Regenboogvlag: View {
    var regenboogkleuren = rainbowColors;
    
    public var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<regenboogkleuren.count, id: \.self) { number in
                Rectangle()
                    .foregroundStyle(regenboogkleuren[number])
            }
        }
        .cornerRadius(10)
    }
}
