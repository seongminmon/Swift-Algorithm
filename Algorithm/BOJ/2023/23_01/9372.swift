//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/13.
//
// 9372 : 상근이의 여행
// https://www.acmicpc.net/problem/9372

import Foundation

let t = Int(readLine()!)!
var result = ""
for _ in 0 ..< t {
    let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (n,m) = (nm[0], nm[1])
    for _ in 0 ..< m { _ = readLine()! }
    result += "\(n-1)\n"
}
print(result)
