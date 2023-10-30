//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/30.
//
// 4386 : 별자리 만들기
// https://www.acmicpc.net/problem/4386

import Foundation

let n = Int(readLine()!)!
var points = [(Double, Double)]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Double(String($0))! }
    points.append((input[0], input[1]))
}

var edges = [(Int,Int,Double)]()
for i in 0..<n-1 {
    let (x1, y1) = points[i]
    for j in (i+1)..<n {
        let (x2, y2) = points[j]
        let dist = ((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1)).squareRoot()
        edges.append((i, j, dist))
    }
}
edges.sort { $0.2 < $1.2 }

var parents = [Int](repeating: 0, count: n)
for i in 0..<n { parents[i] = i }

func find(_ a: Int) -> Int {
    if parents[a] != a {
        parents[a] = find(parents[a])
    }
    return parents[a]
}

func union(_ a: Int, _ b: Int) {
    let pa = find(a)
    let pb = find(b)
    
    if pa > pb {
        parents[pa] = pb
    } else {
        parents[pb] = pa
    }
}

var ans: Double = 0
for (a, b, cost) in edges {
    if find(a) != find(b) {
        union(a, b)
        ans += cost
    }
}
print(ans)
