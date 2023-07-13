//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/10.
//
// 14500 : 테트로미노
// https://www.acmicpc.net/problem/14500

import Foundation

// 입력
let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var graph = [[Int]](repeating: [], count: n)
for i in 0 ..< n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[i] = input
}

// 풀이
// 0 세개 앞뒤로
for i in 0 ..< n {
    for _ in 0 ..< 3 {
        graph[i].insert(0, at: 0)
        graph[i].append(0)
    }
}
// 맨끝에 0 세줄 추가
for _ in 0 ..< 3 {
    graph.append([Int](repeating: 0, count: m+6))
}
// 맨위에 0 세줄 추가
for _ in 0 ..< 3 {
    graph.insert(([Int](repeating: 0, count: m+6)), at: 0)
}

var result = 0
var (a1,a2,b1,c1,c2,c3,c4,c5,c6,c7,c8,d1,d2,d3,d4,e1,e2,e3,e4) = (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
for i in 3 ..< n+3 {
    for j in 3 ..< m+3 {
        // 폴리오미노 1
        a1 = graph[i][j] + graph[i][j+1] + graph[i][j+2] + graph[i][j+3]
        a2 = graph[i][j] + graph[i+1][j] + graph[i+2][j] + graph[i+3][j]

        // 폴리오미노 2
        b1 = graph[i][j] + graph[i][j+1] + graph[i+1][j] + graph[i+1][j+1]

        // 폴리오미노 3
        c1 = graph[i][j] + graph[i+1][j] + graph[i+2][j] + graph[i+2][j+1]
        c2 = graph[i][j] + graph[i+1][j] + graph[i+2][j] + graph[i+2][j-1]
        c3 = graph[i][j] + graph[i][j+1] + graph[i][j+2] + graph[i-1][j+2]
        c4 = graph[i][j] + graph[i][j+1] + graph[i][j+2] + graph[i+1][j+2]
        c5 = graph[i][j] + graph[i][j-1] + graph[i+1][j] + graph[i+2][j]
        c6 = graph[i][j] + graph[i-1][j] + graph[i][j+1] + graph[i][j+2]
        c7 = graph[i][j] + graph[i][j+1] + graph[i+1][j] + graph[i+2][j]
        c8 = graph[i][j] + graph[i+1][j] + graph[i][j+1] + graph[i][j+2]

        // 폴리오미노 4
        d1 = graph[i][j] + graph[i+1][j] + graph[i+1][j+1] + graph[i+2][j+1]
        d2 = graph[i][j] + graph[i+1][j] + graph[i][j+1] + graph[i-1][j+1]
        d3 = graph[i][j] + graph[i][j+1] + graph[i-1][j+1] + graph[i-1][j+2]
        d4 = graph[i][j] + graph[i][j+1] + graph[i+1][j+1] + graph[i+1][j+2]

        // 폴리오미노 5
        e1 = graph[i][j] + graph[i][j+1] + graph[i][j+2] + graph[i-1][j+1]
        e2 = graph[i][j] + graph[i][j+1] + graph[i][j+2] + graph[i+1][j+1]
        e3 = graph[i][j] + graph[i][j-1] + graph[i-1][j] + graph[i+1][j]
        e4 = graph[i][j] + graph[i][j+1] + graph[i-1][j] + graph[i+1][j]
        
        result = max(result, a1,a2, b1, c1,c2,c3,c4,c5,c6,c7,c8, d1,d2,d3,d4, e1,e2,e3,e4)
    }
}

// 출력
print(result)
