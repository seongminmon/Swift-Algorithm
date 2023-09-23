//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/09/16.
//
// 2096 : 내려가기
// https://www.acmicpc.net/problem/2096

import Foundation

let n = Int(readLine()!)!
var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph.append(input)
}

var maxDp = graph
var minDp = graph
for i in 1..<n {
    maxDp[i][0] += max(maxDp[i-1][0], maxDp[i-1][1])
    maxDp[i][1] += max(maxDp[i-1][0], maxDp[i-1][1], maxDp[i-1][2])
    maxDp[i][2] += max(maxDp[i-1][1], maxDp[i-1][2])
    
    minDp[i][0] += min(minDp[i-1][0], minDp[i-1][1])
    minDp[i][1] += min(minDp[i-1][0], minDp[i-1][1], minDp[i-1][2])
    minDp[i][2] += min(minDp[i-1][1], minDp[i-1][2])
}

print(maxDp[n-1].max()!, minDp[n-1].min()!)
