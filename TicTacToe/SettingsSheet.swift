//
//  SettingsSheet.swift
//  TicTacToe
//
//  Created by Noah Albrock on 19/10/2025.
//

import SwiftUI

struct SettingsSheet: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            List {
                // MARK: - Heading
                Section {
                    HStack {
                        Image(.appIconGrid)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 64, height: 64)
                            .foregroundStyle(.white.gradient)
                        
                        Spacer().frame(width: 16)
                        
                        VStack(alignment: .leading) {
                            Text("TicTacToe")
                                .font(.title)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                            Text("Hyjaxaru's MicroApps")
                        }
                        .foregroundStyle(.white)
                    }
                }
                .listRowBackground(Rectangle().fill(Color.accentColor.gradient))
                
                // MARK: - General
                Section("General") {
                    Text("TODO").badge("TODO")
                }
                
                // MARK: - About
                Section("About \"TicTacToe\"") {
                    Link(destination: URL(string: "www.hyjaxaru.dev")!) {
                        Text("About Me").badge("github.com")
                    }
                    
                    Link(destination: URL(string: "www.hyjaxaru.dev")!) {
                        Text("About Me").badge("hyjaxaru.dev")
                    }
                    
                    Link(destination: URL(string: "microapps.hyjaxaru.dev")!) {
                        Text("MicroApps").badge("hyjaxaru.dev")
                    }
                }
                
                Section {
                    HStack(spacing: 0) {
                        Spacer()
                        Text("Made with ")
                        Image(systemName: "heart.fill")
                            .foregroundStyle(.pink.gradient)
                        Text(" by Hyjaxaru")
                        Spacer()
                    }
                    .foregroundStyle(.secondary)
                }
                .listRowBackground(Color.clear)
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    if #available(iOS 26.0, *) {
                        Button("Done", systemImage: "checkmark", role: .confirm) {
                            isPresented.toggle()
                        }
                    } else {
                        Button("Done") {
                            isPresented.toggle()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsSheet(isPresented: .constant(true))
}
