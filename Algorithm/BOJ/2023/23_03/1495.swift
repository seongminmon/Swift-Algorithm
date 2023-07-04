//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/15.
//
// 1495 : 기타리스트
// https://www.acmicpc.net/problem/1495

import Foundation

let nsm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,s,m) = (nsm[0], nsm[1], nsm[2])
var volumeList = readLine()!.split(separator: " ").map{ Int(String($0))! }

var dp = [[Bool]](repeating: [Bool](repeating: false, count: m+1), count: n+1)
dp[0][s] = true

for i in 1 ... n {
    for j in 0 ... m {
        if dp[i-1][j] == true {
            let volume = volumeList[i-1]
            if j + volume <= m {
                dp[i][j + volume] = true
            }
            if j - volume >= 0 {
                dp[i][j - volume] = true
            }
        }
    }
}

var MAX = -1
for i in 0 ... m {
    if dp[n][i] == true {
        MAX = i
    }
}
print(MAX)
