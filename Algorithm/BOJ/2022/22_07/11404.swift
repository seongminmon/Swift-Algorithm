//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/07/23.
//
// 11404 : 플로이드
// https://www.acmicpc.net/problem/11404

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

let INF = Int(1e9)
var ans = [[Int]](repeating: [Int](repeating: INF, count: n+1), count: n+1)
for i in 1 ... n { ans[i][i] = 0 }
for _ in 0 ..< m {
    let abc = readLine()!.split(separator: " ").map{Int(String($0))!}
    if ans[abc[0]][abc[1]] > abc[2] {
        ans[abc[0]][abc[1]] = abc[2]
    }
}

for k in 1 ... n {
    for i in 1 ... n {
        for j in 1 ... n {
            ans[i][j] = min(ans[i][j], ans[i][k] + ans[k][j])
        }
    }
}

for i in 1 ... n {
    for j in 1 ... n {
        print(ans[i][j] == INF ? 0 : ans[i][j], terminator: " ")
    }
    print("")
}
