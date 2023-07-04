//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/10.
//
// 2156 : 포도주 시식
// https://www.acmicpc.net/problem/2156

import Foundation

// 입력
let n = Int(readLine()!)!
var arr = [0,0]
for _ in 0 ..< n {
    arr.append(Int(readLine()!)!)
}

// 풀이
var dp = [Int](repeating: 0, count: n+2)
dp[2] = arr[2]

for i in 3 ..< n+2 {
    dp[i] = max(dp[i-1],
                dp[i-2] + arr[i],
                dp[i-3] + arr[i-1] + arr[i])
}

// 출력
print(dp.last!)
