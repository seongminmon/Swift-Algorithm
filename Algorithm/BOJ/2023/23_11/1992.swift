//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 11/29/23.
//
// 1992 : 쿼드트리
// https://www.acmicpc.net/problem/1992

import Foundation

let n = Int(readLine()!)!
var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.map { Int(String($0))! }
    graph.append(input)
}

var ans = ""
func solve(_ x: Int, _ y: Int, _ len: Int) {
    if len == 1 {
        ans += "\(graph[x][y])"
        return
    }
    
    var flag = true
    let value = graph[x][y]
    outerLoop: for i in x..<x+len {
        for j in y..<y+len {
            if graph[i][j] != value {
                flag = false
                break outerLoop
            }
        }
    }
    
    
    if flag {
        ans += "\(value)"
    } else {
        ans += "("
        solve(x, y, len/2)
        solve(x, y+len/2, len/2)
        solve(x+len/2, y, len/2)
        solve(x+len/2, y+len/2, len/2)
        ans += ")"
    }
}

solve(0, 0, n)

print(ans)
