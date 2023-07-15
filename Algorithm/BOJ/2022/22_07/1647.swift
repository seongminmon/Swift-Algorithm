//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/07/26.
//
// 1647 : 도시 분할 계획
// https://www.acmicpc.net/problem/1647

import Foundation

let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])

func find(_ arr: inout [Int], _ x: Int) -> Int {
    if arr[x] != x {
        arr[x] = find(&arr, arr[x])
    }
    return arr[x]
}

func union(_ arr: inout [Int], _ a: Int, _ b: Int) {
    let x = find(&arr, a)
    let y = find(&arr, b)
    
    if x >= y {
        arr[x] = y
    } else {
        arr[y] = x
    }
}

func kruskal(_ edge: [(Int,Int,Int)], _ arr: inout [Int]) -> Int {
    var mstCost = 0
    var edgeCnt = 0
    var cost = [Int]()
    for (a,b,c) in edge {
        if find(&arr, a) != find(&arr, b) {
            union(&arr, a, b)
            cost.append(c)
            mstCost += c
            edgeCnt += 1
        }
        if edgeCnt == arr.count-1 {
            break
        }
    }
    return mstCost - cost.max()!
}

var parent = [Int](repeating: 0, count: n+1)
for i in 1 ... n { parent[i] = i }

var edge = [(Int,Int,Int)]()
for _ in 1 ... m {
    let abc = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (a,b,c) = (abc[0], abc[1], abc[2])
    edge.append((a,b,c))
}

edge = edge.sorted{ $0.2 < $1.2 }
var ans = kruskal(edge, &parent)
print(ans)
