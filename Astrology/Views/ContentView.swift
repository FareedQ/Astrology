//
//  ContentView.swift
//  Astrology
//
//  Created by Fareed Quraishi on 2024-04-17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AstrologyView()
                .tabItem {
                    Image(systemName: "moon.stars")
                    Text("Natal Chart")
                }
            ChatView()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Astro Chat")
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
