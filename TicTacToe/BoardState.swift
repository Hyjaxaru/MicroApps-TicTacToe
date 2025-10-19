//
//  BoardState.swift
//  TicTacToe
//
//  Created by Noah Albrock on 14/10/2025.
//

import Combine
import Foundation
import SwiftUI

enum BoardCellState: Equatable {
    case empty, x, o
    
    var systemIcon: String {
        switch self {
        case .x: return "xmark";
        case .o: return "circle";
        default: return "app";
        }
    }
}

enum BoardWinPositions {
    case topRow, middleRow, bottomRow
    case leftCol, middleCol, rightCol
    case diagonalTopLeft, diagonalTopRight
}

class BoardState: ObservableObject {
    @Published var board: [[BoardCellState]]
    @Published var winner: BoardCellState?
    
    // MARK: - Initializers
    
    /// Generate a game board of a specific size
    init() {
        self.board = Array(repeating: Array(repeating: .empty, count: 3), count: 3)
    }
    
    /// Create state with a custom board
    init(board: [[BoardCellState]]) {
        self.board = board
    }
    
    // MARK: - Functions
    
    /// Checks if playing in a cell is valid
    func checkMoveIsValid(row: Int, col: Int) -> Bool {
        return board[row][col] == .empty
    }
    
    /// Check if there is a winner
    func findWinner() {
        // horizontals
        for i in 0..<3 {
            if board[i].allSatisfy({ $0 == board[i].first! }) {
                DispatchQueue.main.async { self.winner = self.board[i].first! }
                return
            }
        }
        
        // verticals
        for i in 0..<3 {
            // take a record of one of the items in the column
            let temp = board[i][i]
            
            // loop through every row at one column
            for j in 0..<3 {
                // if the item doesnt match, continue
                if board[j][i] != temp {
                    continue
                }
                
                // assuming the whole row is the same, we complete!
                if board[i].allSatisfy({ $0 == board[i].first! }) {
                    DispatchQueue.main.async { self.winner = self.board[i].first! }
                    return
                }
            }
        }
        
        // diagonals
        if (0..<3).allSatisfy({ board[$0][$0] == board.first!.first! }) {
            DispatchQueue.main.async { self.winner = self.board.first!.first! }
            return
        }
        
        if (0..<3).allSatisfy({ board[3-$0][$0] == board.first!.last! }) {
            DispatchQueue.main.async { self.winner = self.board.first!.last! }
            return
        }
    }
}
