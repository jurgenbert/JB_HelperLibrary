//
//  Helper.swift
//
//  Created by Jurgen Bert on 20/11/2025.
//

import SwiftUI

public let rainbowColors = [Color.purple, Color.blue, Color.green,Color.yellow, Color.orange, Color.red]
public let transgenderRainbowColors = [Color.cyan.opacity(0.5),Color.pink.opacity(0.5),Color.white,Color.pink.opacity(0.5),Color.cyan.opacity(0.5)]
public let landenAPI = "https://cdn.simplelocalize.io/public/v1/countries"

// Open Weather Map api
public let apikey = "60ef9bab9364412b2ca4c66f535199ed" // jurgen.bert@sjsp.be
public let weatherAPI = "https://api.openweathermap.org/data/2.5/weather?appid=\(apikey)&units=metric&lang=nl&q="

// Vlaggen API
public let vlagAPI = "https://flagcdn.com/16x12/"

// HeaderView
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

// RoundedRectangleWithText
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

// ActivityRing
public struct ActivityRing: View {
    var progress: Double
    var ringColor: Color = Color.accentColor
    
    public var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.3)
                .foregroundStyle(ringColor)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundStyle(ringColor)
                .rotationEffect(.degrees(270.0))
                .animation(.linear(duration: 0.5), value: progress)
            Text(String(format: "%.0f%%", min(progress, 1.0) * 100))
                .font(.largeTitle)
                .bold()
                .foregroundStyle(ringColor)
        }
    }
}

//DashboardRing
public struct DashboardRing: View {
    @Binding var progress: Double
    var ringColor: Color = Color.accentColor
    
    public var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundStyle(Color.accentColor)
                .opacity(0.3)
            VStack{
                ActivityRing(progress: progress, ringColor: ringColor )
                    .padding()
                Slider(value: $progress)
                    .padding()
            }
        }
    }
}

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

public func dateString2Date(_ string: String) -> Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.date(from: string)
}

public func cel2fahr(_ cel: Double) -> Double {
    (cel * 9/5) + 32
}

public func fahr2cel(_ fahr: Double) -> Double {
    (fahr - 32) * 5/9
}

