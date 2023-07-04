//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/02.
//
// 25682 : 체스판 다시 칠하기 2
// https://www.acmicpc.net/problem/25682

import Foundation

let nmk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m,k) = (nmk[0], nmk[1], nmk[2])

var board = [[String]]()
for _ in 0 ..< n {
    let input = readLine()!.map{ String($0) }
    board.append(input)
}

func solve(_ color: String) -> Int {
    var dp = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)
    for i in 0 ..< n {
        for j in 0 ..< m {
            var value = -1
            if (i+j) % 2 == 0 {
                value = board[i][j] != color ? 1 : 0
            } else {
                value = board[i][j] == color ? 1 : 0
            }
            dp[i+1][j+1] = dp[i+1][j] + dp[i][j+1] - dp[i][j] + value
        }
    }
    
    var count = Int.max
    for i in 1 ... n - k + 1 {
        for j in 1 ... m - k + 1 {
            let (i2, j2) = (i + k - 1, j + k - 1)
            let temp = dp[i2][j2] - dp[i2][j-1] - dp[i-1][j2] + dp[i-1][j-1]
            count = min(count, temp)
        }
    }
    return count
}

print(min(solve("B"), solve("W")))
