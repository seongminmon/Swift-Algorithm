//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/02.
//
// 11659 : 구간 합 구하기 4
// https://www.acmicpc.net/problem/11659

import Foundation

let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])

let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
var sumArr = [Int](repeating: 0, count: n)
sumArr[0] = arr[0]
for i in 1 ..< n {
    sumArr[i] = sumArr[i-1] + arr[i]
}

var result = ""
for _ in 0 ..< m {
    let se = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (s,e) = (se[0]-1, se[1]-1)
    result += "\(sumArr[e] - sumArr[s] + arr[s])\n"
}
print(result)
