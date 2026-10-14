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
public enum JB_HelperLibraryConfig {
    public static var openWeatherMapAPIKey: String = ""
}

public func weatherAPI(for city: String) -> String {
    "https://api.openweathermap.org/data/2.5/weather?appid=\(JB_HelperLibraryConfig.openWeatherMapAPIKey)&units=metric&lang=nl&q=\(city)"
}

// Vlaggen API
public let vlagAPI = "https://flagcdn.com/16x12/"

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
