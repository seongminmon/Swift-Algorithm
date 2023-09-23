//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/09/06.
//
// 1922 : 네트워크 연결
// https://www.acmicpc.net/problem/1922

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var edges = [(Int,Int,Int)]()
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a,b,c) = (abc[0], abc[1], abc[2])
    edges.append((a,b,c))
}
edges.sort { $0.2 < $1.2 }

var parent = [Int](repeating: 0, count: n+1)
for i in 1...n { parent[i] = i }

func find(_ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = find(parent[x])
    }
    return parent[x]
}

func union(_ x: Int, _ y: Int) {
    let px = find(x)
    let py = find(y)
    
    if px <= py {
        parent[py] = px
    } else {
        parent[px] = py
    }
}

var cnt = 0
var ans = 0
for edge in edges {
    if cnt == n-1 { break }
    
    let (a,b,c) = edge
    if find(a) != find(b) {
        union(a, b)
        ans += c
        cnt += 1
    }
}
print(ans)
