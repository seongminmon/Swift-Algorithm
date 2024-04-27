//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 4/23/24.
//
// 1269 : 대칭 차집합
// https://www.acmicpc.net/problem/1269

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

let A: Set<Int> = Set(readLine()!.split(separator: " ").map { Int(String($0))! })
let B: Set<Int> = Set(readLine()!.split(separator: " ").map { Int(String($0))! })

//print(A.subtracting(B).count + B.subtracting(A).count)
print(A.symmetricDifference(B).count)
