//
//  2887.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/14.
//
// 2887 : 행성 터널
// https://www.acmicpc.net/problem/2887

import Foundation

// 입력
let n = Int(readLine()!)!
var graph = [(Int,Int,Int,Int)]()   // (번호,x,y,z)
for i in 0 ..< n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph.append((i, input[0], input[1], input[2]))
}

// 풀이
let xsort = graph.sorted { $0.1 < $1.1 }
let ysort = graph.sorted { $0.2 < $1.2 }
let zsort = graph.sorted { $0.3 < $1.3 }

var edges = [(Int,Int,Int)]()   // (비용,번호,번호)
for i in 0 ..< n-1 {
    edges.append((abs(xsort[i].1 - xsort[i+1].1), xsort[i].0, xsort[i+1].0))
    edges.append((abs(ysort[i].2 - ysort[i+1].2), ysort[i].0, ysort[i+1].0))
    edges.append((abs(zsort[i].3 - zsort[i+1].3), zsort[i].0, zsort[i+1].0))
}
edges.sort { $0.0 < $1.0 }

// 유니온-파인드
var parent = [Int](repeating: 0, count: n)
for i in 0 ..< n { parent[i] = i }

func find(_ a: Int) -> Int {
    let x = a
    if x != parent[x] {
        parent[x] = find(parent[x])
    }
    return parent[x]
}

func union(_ a: Int, _ b: Int) {
    let x = find(a)
    let y = find(b)
    if x <= y {
        parent[y] = x
    } else {
        parent[x] = y
    }
}

// 크루스칼
var result = 0
var cnt = 0
for (dist, i, j) in edges {
    if cnt == n-1 {
        break
    }
    
    // 사이클 생성 안 하면 추가
    if find(i) != find(j) {
        union(i,j)
        result += dist
        cnt += 1
    }
}

// 출력
print(result)
