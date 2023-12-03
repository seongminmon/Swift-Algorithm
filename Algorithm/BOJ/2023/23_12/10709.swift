//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 12/3/23.
//
// 10709 : 기상캐스터
// https://www.acmicpc.net/problem/10709

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var graph = [[String]]()
for _ in 0..<n {
    let input = readLine()!.map { String($0) }
    graph.append(input)
}

var result = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
var queue = [(Int,Int)]()
var idx = 0
for i in 0..<n {
    for j in 0..<m {
        if graph[i][j] == "c" {
            queue.append((i,j))
            result[i][j] = 0
        }
    }
}

while idx < queue.count {
    let (x,y) = queue[idx]
    idx += 1
    
    if y+1 < m && result[x][y+1] == -1 {
        result[x][y+1] = result[x][y] + 1
        queue.append((x,y+1))
    }
}

for i in 0..<n {
    print(result[i].map { String($0) }.joined(separator: " "))
}
