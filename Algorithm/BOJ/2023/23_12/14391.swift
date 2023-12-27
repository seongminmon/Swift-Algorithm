//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 12/27/23.
//
// 14391 : 종이 조각
// https://www.acmicpc.net/problem/14391

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var board = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.map { Int(String($0))! }
    board.append(input)
}

var ans = 0
for bitmask in 0..<(1 << (n*m)) {
    var totalSum = 0
    
    // 가로 합
    for i in 0..<n {
        var rowSum = 0
        for j in 0..<m {
            let idx = i * m + j
            if bitmask & (1 << idx) == 0 {
                rowSum = rowSum * 10 + board[i][j]
            } else {
                totalSum += rowSum
                rowSum = 0
            }
        }
        totalSum += rowSum
    }
    
    // 세로 합
    for j in 0..<m {
        var colSum = 0
        for i in 0..<n {
            let idx = i * m + j
            if bitmask & (1 << idx) != 0 {
                colSum = colSum * 10 + board[i][j]
            } else {
                totalSum += colSum
                colSum = 0
            }
        }
        totalSum += colSum
    }
    
    ans = max(ans, totalSum)
}

print(ans)
