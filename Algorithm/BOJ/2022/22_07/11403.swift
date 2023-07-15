//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/07/23.
//
// 11403 : 경로 찾기
// https://www.acmicpc.net/problem/11403

import Foundation

let n = Int(readLine()!)!

let INF = Int(1e9)
var ans = [[Int]](repeating: [], count: n)
for i in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{Int(String($0))! == 0 ? INF : Int(String($0))!}
    ans[i] = input
}

for k in 0 ..< n {
    for i in 0 ..< n {
        for j in 0 ..< n {
            ans[i][j] = min(ans[i][j], ans[i][k] + ans[k][j])
        }
    }
}

for i in 0 ..< n {
    for j in 0 ..< n {
        print(ans[i][j] == INF ? 0 : 1, terminator: " ")
    }
    print("")
}

