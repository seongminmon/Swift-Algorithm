//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/14.
//
// 2098 : 외판원 순회
// https://www.acmicpc.net/problem/2098

import Foundation

let n = Int(readLine()!)!
var w = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    w.append(input)
}

let INF = Int(1e9)
var dp = [[Int]](repeating: [Int](repeating: 0, count: 1<<n), count: n)
func dfs(_ now: Int, _ bitmask: Int) -> Int {
    // 모두 방문했을 시
    if bitmask == (1<<n) - 1 {
        return w[now][0] == 0 ? INF : w[now][0]
    }
    
    // 이미 dp값이 있다면
    if dp[now][bitmask] != 0 {
        return dp[now][bitmask]
    }
    
    var ret = INF
    for i in 0..<n {
        // 가능 경로가 있고, 미방문일 때
        if w[now][i] != 0 && (bitmask & (1<<i)) == 0 {
            ret = min(ret, w[now][i] + dfs(i, bitmask | (1<<i)))
        }
    }
    dp[now][bitmask] = ret
    return ret
}

print(dfs(0, 1))
