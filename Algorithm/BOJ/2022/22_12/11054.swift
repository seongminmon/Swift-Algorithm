//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/10.
//
// 11054 : 가장 긴 바이토닉 부분 수열
// https://www.acmicpc.net/problem/11054

import Foundation

// 입력
let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

// 풀이
func makeDP(_ arr: [Int]) -> [Int] {
    var dp = [Int](repeating: 1, count: n)
    for i in 1 ..< n {
        for j in 0 ..< i {
            if arr[j] < arr[i] {
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
    }
    return dp
}

// 1. 증가
let dp1 = makeDP(arr)
// 2. 감소
let dp2 = Array(makeDP(arr.reversed()).reversed())

// 출력
var result = 0
for i in 0 ..< n {
    result = max(result, dp1[i] + dp2[i])
}
print(result - 1)
