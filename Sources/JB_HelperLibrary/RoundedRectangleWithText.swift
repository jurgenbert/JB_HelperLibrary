//
//  RoundedRectangleWithText.swift
//  JB_HelperLibrary
//
//  Created by Jurgen Bert on 14/10/2026.
//


public struct RoundedRectangleWithText: View {
    var title: String = "Title"
    var back = Color.accentColor
    var textColor = Color.white
    
    init(_ title: String, back: SwiftUI.Color = Color.accentColor, textColor: SwiftUI.Color = Color.white) {
        self.title = title
        self.back = back
        self.textColor = textColor
    }
    
    public var body: some View{
        Text(title)
            .foregroundStyle(textColor)
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 20)
                    .fill(back)
            }
            .padding()
    }
}
