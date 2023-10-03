//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/03.
//
// 1717 : 집합의 표현
// https://www.acmicpc.net/problem/1717

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var parent = [Int](repeating: 0, count: n+1)
for i in 0...n { parent[i] = i }

func find(_ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = find(parent[x])
    }
    return parent[x]
}

func union(_ x: Int, _ y: Int) {
    let px = find(x)
    let py = find(y)
    
    if px > py {
        parent[py] = px
    } else {
        parent[px] = py
    }
}

for _ in 0..<m {
    let order = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a,b) = (order[1], order[2])
    
    if order[0] == 0 {
        union(a, b)
    } else {
        print(find(a) == find(b) ? "YES" : "NO")
    }
}
