//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/18.
//
// 2263 : 트리의 순회
// https://www.acmicpc.net/problem/2263

import Foundation

let n = Int(readLine()!)!
let inOrder = readLine()!.split(separator: " ").map { Int(String($0))! }
let postOrder = readLine()!.split(separator: " ").map { Int(String($0))! }

var indexList = [Int](repeating: 0, count: n+1)
for i in 0..<n {
    indexList[inOrder[i]] = i
}

var preOrder = ""
func solve(_ inS: Int, _ inE: Int, _ postS: Int, _ postE: Int) {
    guard inS <= inE && postS <= postE else { return }
    
    // root
    let root = postOrder[postE]
    preOrder += "\(root) "
    
    let rootIndex = indexList[root]
    let nextPostE = postS + rootIndex - inS - 1
    
    // left
    solve(inS, rootIndex-1, postS, nextPostE)
    // right
    solve(rootIndex+1, inE, nextPostE+1, postE-1)
}

solve(0, n-1, 0, n-1)

print(preOrder)
