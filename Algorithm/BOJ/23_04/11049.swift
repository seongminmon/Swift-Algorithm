//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/10.
//
// 11049 : 행렬 곱셈 순서
// https://www.acmicpc.net/problem/11049

import Foundation

let n = Int(readLine()!)!
var matrix = [(Int,Int)]()
for _ in 0 ..< n {
    let rc = readLine()!.split(separator: " ").map{ Int(String($0))! }
    matrix.append((rc[0], rc[1]))
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
for i in 1 ..< n {
    for start in 0 ..< n-i {
        let end = i + start
        
        var temp = Int.max
        for mid in start ..< end {
            temp = min(temp, dp[start][mid] + dp[mid+1][end] + matrix[start].0 * matrix[mid].1 * matrix[end].1)
        }
        dp[start][end] = temp
    }
}

print(dp[0][n-1])
