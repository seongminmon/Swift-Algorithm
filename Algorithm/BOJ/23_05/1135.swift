//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/04.
//
// 1135 : 뉴스 전하기
// https://www.acmicpc.net/problem/1135

import Foundation

let n = Int(readLine()!)!
let parents = readLine()!.split(separator: " ").map { Int(String($0))! }

var tree = [[Int]](repeating: [], count: n)
for i in 1..<n {
    tree[parents[i]].append(i)
}

func dfs(_ node: Int) -> Int {
    var childs = [Int]()
    for next in tree[node] {
        childs.append(dfs(next))
    }
    childs.sort(by: >)
    
    var Max = 0
    for i in 0..<childs.count {
        Max = max(Max, childs[i] + i + 1)
    }
    return Max
}

print(dfs(0))
