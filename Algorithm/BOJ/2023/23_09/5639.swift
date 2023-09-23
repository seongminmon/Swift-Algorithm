//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/09/19.
//
// 5639 : 이진 검색 트리
// https://www.acmicpc.net/problem/5639

import Foundation

var tree = [Int]()
while let input = readLine() {
    tree.append(Int(input)!)
}

func solve(_ tree: [Int]) {
    if tree.isEmpty { return }
    
    let root = tree[0]
    var idx = 1
    while idx < tree.count {
        if root < tree[idx] {
            break
        }
        idx += 1
    }
    
    let left = Array(tree[1..<idx])
    let right: [Int] = idx < tree.count ? Array(tree[idx...]) : []
    solve(left)
    solve(right)
    print(root)
}

solve(tree)
