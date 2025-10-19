//
//  ContentView.swift
//  TicTacToe
//
//  Created by Noah Albrock on 14/10/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var boardState: BoardState = .init()
    
    @State var showSettingsSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                
                // MARK: - Quick Game Board
                Section {
                    HStack {
                        Spacer()
                        GameBoard()
                            .environmentObject(boardState)
                        Spacer()
                    }
                }
            }
            .navigationTitle("TicTacToe")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Settings", systemImage: "gear") {
                        showSettingsSheet.toggle()
                    }.sheet(isPresented: $showSettingsSheet) {
                        SettingsSheet(isPresented: $showSettingsSheet)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
