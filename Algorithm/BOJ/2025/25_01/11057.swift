//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 1/8/25.
//
// 11057 : 오르막 수
// https://www.acmicpc.net/problem/11057

import Foundation

let n = Int(readLine()!)!
let mod = 10_007

// 길이가 n인 오르막 수의 개수
// n = 4면 (0000 ~ 9999) -> 10^4개 고려 필요
// 최대 10^1000 이니까 완탐은 불가능

// 임의의 오르막수 뒤에 숫자 하나를 추가하는 형태
// (오르막수) + 숫자 추가 -> 마지막 숫자 이상의 수가 와야 함
// (오르막수아님) + 숫자 추가 -> 어떤 숫자가 오더라도 오르막수가 되지 않음

// 끝자리가 0~9인 케이스로 나눠보기
// dp[i][j] = i자리, 끝이 j인 오르막수의 개수
// ex) dp[2][1] = 끝이 1인 2자리 오르막수의 개수
var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n+1)

// 1자리 0~9 모두 오르막수
for j in 0..<10 { dp[1][j] = 1 }

// dp[i][j] = dp[i-1][0] + ... + dp[i-1][j]
for i in stride(from: 2, through: n, by: 1) {
    for j in 0..<10 {
        for k in 0...j {
            dp[i][j] += dp[i-1][k] % mod
        }
        dp[i][j] %= mod
    }
}

print(dp[n].reduce(0, +) % mod)
