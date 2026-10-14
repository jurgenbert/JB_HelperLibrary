//
//  ActivityRing.swift
//  JB_HelperLibrary
//
//  Created by Jurgen Bert on 14/10/2026.
//


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
