//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/18.
//
// 1958 : LCS 3
// https://www.acmicpc.net/problem/1958

import Foundation

// 입력
let a = readLine()!.map{ String($0) }
let b = readLine()!.map{ String($0) }
let c = readLine()!.map{ String($0) }

// 풀이
var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: c.count+1), count: b.count+1), count: a.count+1)

for i in 1 ... a.count {
    for j in 1 ... b.count {
        for k in 1 ... c.count {
            if a[i-1] == b[j-1], a[i-1] == c[k-1] {
                dp[i][j][k] = dp[i-1][j-1][k-1] + 1
            } else {
                dp[i][j][k] = max(dp[i][j][k-1], dp[i][j-1][k], dp[i-1][j][k])
            }
        }
    }
}

// 출력
print(dp[a.count][b.count][c.count])
