//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/13.
//
// 11049 : 행렬 곱셈 순서
// https://www.acmicpc.net/problem/11049

import Foundation

// 입력
let n = Int(readLine()!)!
var matrix = [(Int,Int)]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    matrix.append((input[0], input[1]))
}

// 풀이
var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

for d in 1 ..< n {
    for s in 0 ..< n-d {
        let e = s + d
        
        dp[s][e] = Int.max
        for i in s ..< e {
            dp[s][e] = min(dp[s][e], dp[s][i] + dp[i+1][e] + matrix[s].0 * matrix[i].1 * matrix[e].1)
        }
    }
    
}

// 출력
print(dp[0][n-1])
