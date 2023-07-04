//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/08.
//
// 1197 : 최소 스패닝 트리
// https://www.acmicpc.net/problem/1197

import Foundation

let ve = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (v,e) = (ve[0], ve[1])
var edges = [(Int,Int,Int)]()
for _ in 0 ..< e {
    let abc = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (a,b,c) = (abc[0], abc[1], abc[2])
    edges.append((c,a,b))
}
edges.sort { $0.0 < $1.0 }

var parent = [Int](repeating: 0, count: v+1)
for i in 1 ... v { parent[i] = i }

func find(_ x: Int) -> Int {
    if x != parent[x] {
        parent[x] = find(parent[x])
    }
    return parent[x]
}

func union(_ x: Int, _ y: Int) {
    let px = find(x)
    let py = find(y)
    
    if px > py {
        parent[px] = py
    } else {
        parent[py] = px
    }
}

var result = 0
var edgeCnt = 0
for (cost, x, y) in edges {
    if edgeCnt == v-1 { break }
    
    if find(x) != find(y) {
        union(x, y)
        result += cost
        edgeCnt += 1
    }
}
print(result)
