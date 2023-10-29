//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/29.
//
// 2011 : 암호코드
// https://www.acmicpc.net/problem/2011

import Foundation

let arr = readLine()!.map { Int(String($0))! }
let n = arr.count
let mod = 1_000_000

var dp = [Int](repeating: 0, count: n+1)
func solve() {
    if arr[0] == 0 {
        print(0)
        return
    }
    
    dp[0] = 1
    dp[1] = 1
    for i in stride(from: 2, through: n, by: 1) {
        if arr[i-1] == 0 && arr[i-2] == 0 {
            print(0)
            return
        }
        
        if arr[i-1] != 0 {
            dp[i] += dp[i-1]
        }
        
        if arr[i-2] != 0 {
            if arr[i-2] * 10 + arr[i-1] <= 26 {
                dp[i] += dp[i-2]
            }
        }
        
        dp[i] %= mod
    }
    
    print(dp[n])
}

solve()
