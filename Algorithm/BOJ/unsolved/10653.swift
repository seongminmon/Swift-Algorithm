//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/03.
//
// 10653 : 마라톤 2
// https://www.acmicpc.net/problem/10653

// unsolved...

import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,k) = (nk[0], nk[1])

var checkPoints = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    checkPoints.append(input)
}
