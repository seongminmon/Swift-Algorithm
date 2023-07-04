//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/18.
//
// 2056 : 작업
// https://www.acmicpc.net/problem/2056

import Foundation

// 입력
let n = Int(readLine()!)!
var time = [0]
var work: [[Int]] = [[]]
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    time.append(input[0])
    work.append(Array(input[2...]))
}

// 풀이
var dp = [Int](repeating: 0, count: n+1)
for i in 1 ... n {
    for j in 0 ..< work[i].count {
        dp[i] = max(dp[i], dp[work[i][j]])
    }
    dp[i] += time[i]
}

// 출력
print(dp.max()!)
