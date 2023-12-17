//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 12/16/23.
//
// 1285 : 동전 뒤집기
// https://www.acmicpc.net/problem/1285

import Foundation

let n = Int(readLine()!)!
var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.map { $0 == "T" ? 1 : 0 }
    graph.append(input)
}

var ans = Int.max
for bitmask in 0..<(1 << n) {
    if ans == 0 { break }
    
    var temp = 0
    for i in 0..<n {
        
        var cnt = 0
        for j in 0..<n {
            var val = graph[i][j]
            if bitmask & (1 << j) != 0 {
                val = val == 1 ? 0 : 1
            }
            cnt += val
        }
        
        temp += min(cnt, n - cnt)
    }
    
    ans = min(ans, temp)
}
print(ans)
