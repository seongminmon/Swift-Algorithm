//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/09.
//
// 3085 : 사탕 게임
// https://www.acmicpc.net/problem/3085

import Foundation

let n = Int(readLine()!)!
var board = [[String]]()
for _ in 0 ..< n {
    let input = readLine()!.map{ String($0) }
    board.append(input)
}

func swap(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) {
    let temp = board[x1][y1]
    board[x1][y1] = board[x2][y2]
    board[x2][y2] = temp
}

func findMaxCnt() {
    var rowCnt = 1
    var colCnt = 1
    
    for i in 0 ..< n {
        rowCnt = 1
        colCnt = 1
        for j in 0 ..< n-1 {
            if board[i][j] == board[i][j+1] {
                rowCnt += 1
                result = max(result, rowCnt)
            } else {
                rowCnt = 1
            }
            
            if board[j][i] == board[j+1][i] {
                colCnt += 1
                result = max(result, colCnt)
            } else {
                colCnt = 1
            }
        }
    }
}

var result = 1
for i in 0 ..< n {
    for j in 0 ..< n-1 {
        if board[i][j] != board[i][j+1] {
            swap(i, j, i, j+1)
            findMaxCnt()
            swap(i, j, i, j+1)
        }
        
        if board[j][i] != board[j+1][i] {
            swap(j, i, j+1, i)
            findMaxCnt()
            swap(j, i, j+1, i)
        }
    }
}
print(result)
