//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/30.
//
// 1956 : 운동
// https://www.acmicpc.net/problem/1956

import Foundation

// 입력
let ve = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (v,e) = (ve[0], ve[1])

let MAX = Int(1e9)
var graph = [[Int]](repeating: [Int](repeating: MAX, count: v), count: v)
for _ in 0 ..< e {
    let abc = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (a,b,c) = (abc[0]-1, abc[1]-1, abc[2])
    graph[a][b] = c
}

// 풀이
for k in 0 ..< v {
    for i in 0 ..< v {
        for j in 0 ..< v {
            graph[i][j] = min(graph[i][j],
                graph[i][k] + graph[k][j])
        }
    }
}

// 출력
var result = MAX
for i in 0 ..< v {
    result = min(result, graph[i][i])
}
print(result == MAX ? -1 : result)
