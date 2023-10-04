//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/03.
//
// 2580 : 스도쿠
// https://www.acmicpc.net/problem/2580

import Foundation

var board = [[Int]]()
var target = [(Int,Int)]()
for i in 0..<9 {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(input)
    
    for j in 0..<9 {
        if board[i][j] == 0 {
            target.append((i,j))
        }
    }
}

func dfs(_ idx: Int) {
    // 종료 조건
    if idx == target.count {
        for i in 0..<9 {
            for j in 0..<9 {
                print(board[i][j], terminator: " ")
            }
            print()
        }
        exit(0)
    }
    
    let (x,y) = target[idx]
    for num in 1...9 {
        if check(x, y, num) {
            board[x][y] = num
            dfs(idx+1)
            board[x][y] = 0
        }
    }
}

func check(_ x: Int, _ y: Int, _ num: Int) -> Bool {
    // 1. 가로
    for j in 0..<9 {
        if board[x][j] == num {
            return false
        }
    }
    // 2. 세로
    for i in 0..<9 {
        if board[i][y] == num {
            return false
        }
    }
    // 3. 정사각형
    var idx = x / 3 * 3
    var jdx = y / 3 * 3
    for i in idx..<idx+3 {
        for j in jdx..<jdx+3 {
            if board[i][j] == num {
                return false
            }
        }
    }
    
    return true
}

dfs(0)
