//
//  ContentView.swift
//  Astrology
//
//  Created by Fareed Quraishi on 2024-04-17.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        Text("Second View")
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            AstrologyView()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                }
            SecondView()
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
