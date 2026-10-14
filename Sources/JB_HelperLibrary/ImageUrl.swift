public struct ImageUrl: View {
    var url: String
    
    public init(url: String) {
        self.url = url
    }
    
    public var body: some View {
        AsyncImage(url: URL(string:url))  { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Image(systemName: "photo")
                Text("No image available")
            }
        }
    }
}
