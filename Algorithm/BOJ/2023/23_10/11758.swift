//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/09.
//
// 11758 : CCW
// https://www.acmicpc.net/problem/11758

import Foundation

var points = [[Int]]()
for _ in 0..<3 {
    let point = readLine()!.split(separator: " ").map { Int(String($0))! }
    points.append(point)
}

let (x1, y1) = (points[0][0], points[0][1])
let (x2, y2) = (points[1][0], points[1][1])
let (x3, y3) = (points[2][0], points[2][1])

let result = (x1*y2 + x2*y3 + x3*y1) - (x2*y1 + x3*y2 + x1*y3)

if result == 0 {
    print(0)
} else if result > 0 {
    print(1)
} else {
    print(-1)
}
