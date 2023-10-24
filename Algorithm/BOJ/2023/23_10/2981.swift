//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/24.
//
// 2981 : 검문
// https://www.acmicpc.net/problem/2981

import Foundation

let n = Int(readLine()!)!
var arr = [Int]()
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

func findGcd(_ a: Int, _ b: Int) -> Int {
    return a == 0 ? b : findGcd(b % a, a)
}

var diff = [Int]()
for i in 1..<n {
    diff.append(abs(arr[i] - arr[i-1]))
}

var gcd = diff[0]
for i in 1..<n-1 {
    gcd = findGcd(gcd, diff[i])
}

var result = Set<Int>()
result.insert(gcd)

var num = 2
while num * num <= gcd {
    if gcd % num == 0 {
        result.insert(num)
        result.insert(gcd / num)
    }
    num += 1
}

print(result.sorted().map { String($0) }.joined(separator: " "))
