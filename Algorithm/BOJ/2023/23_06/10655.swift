//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/10.
//
// 10655 : 마라톤 1
// https://www.acmicpc.net/problem/10655

import Foundation

let n = Int(readLine()!)!
var checkPoints = [(Int,Int)]()
for _ in 0..<n {
    let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
    checkPoints.append((xy[0], xy[1]))
}

var totalDist = 0
for i in 1..<n {
    let dist = abs(checkPoints[i-1].0 - checkPoints[i].0) + abs(checkPoints[i-1].1 - checkPoints[i].1)
    totalDist += dist
}

var Min = Int.max
for i in 1..<n-1 {
    let dist1 = abs(checkPoints[i-1].0 - checkPoints[i].0) + abs(checkPoints[i-1].1 - checkPoints[i].1)
    let dist2 = abs(checkPoints[i].0 - checkPoints[i+1].0) + abs(checkPoints[i].1 - checkPoints[i+1].1)
    let dist3 = abs(checkPoints[i-1].0 - checkPoints[i+1].0) + abs(checkPoints[i-1].1 - checkPoints[i+1].1)
    Min = min(Min, dist3 - dist1 - dist2)
}
print(totalDist + Min)
