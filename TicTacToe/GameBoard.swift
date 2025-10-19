//
//  GameBoard.swift
//  TicTacToe
//
//  Created by Noah Albrock on 14/10/2025.
//

import SwiftUI

struct GameBoard: View {
    @EnvironmentObject var boardState: BoardState
    
    @State var currentPlayer: BoardCellState = .x
    
    var size: Int { boardState.board.count }
    
    func playAtLocation(_ row: Int, _ col: Int) {
        boardState.board[row][col] = currentPlayer
        currentPlayer = (currentPlayer == .x) ? .o : .x
    }
    
    var body: some View {
        VStack {
            ForEach(0..<size, id: \.self) { row in
                HStack {
                    ForEach(0..<size, id: \.self) { col in
                        let cellState = boardState.board[row][col]
                        Button {
                            playAtLocation(row, col)
                        } label: {
                            Image(systemName: cellState.systemIcon)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundStyle(cellState != .empty ? .primary : .quaternary)
                                .padding()
                                .frame(width: 72, height: 72)
                        }
                        .buttonStyle(.plain)
                        
                        if col < size - 1 {
                            Divider()
                        }
                    }
                }
                
                if row < size - 1 {
                    Divider()
                }
            }
        }
        .frame(width: 250, height: 250)   
    }
}

#Preview {
    GameBoard()
        .environmentObject(BoardState())
}
