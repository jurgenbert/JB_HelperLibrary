//
//  HeaderView.swift
//  JB_HelperLibrary
//
//  Created by Jurgen Bert on 14/10/2026.
//


public struct HeaderView: View {
    var title = "Title"
    var subtitle = "Subtitle"
    var desc = "Use this to..."
    var back = Color.accentColor
    var textColor = Color.white
    
    public init(_ title: String = "Title", subtitle: String = "Subtitle", desc: String = "Use this to...", back: Color = Color.accentColor, textColor: Color = Color.white) {
        self.title = title
        self.subtitle = subtitle
        self.desc = desc
        self.back = back
        self.textColor = textColor
    }
    
    public var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.title)
            
            Text(subtitle)
                .font(.title2)
                .foregroundStyle(.gray)
                .padding()
            
            Text(desc)
                .frame(maxWidth: .infinity)
                .font(.title3)
                .foregroundStyle(textColor)
                .padding()
                .background(back)
        }
    }
}
