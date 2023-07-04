//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/02/14.
//
// 2581 : 소수
// https://www.acmicpc.net/problem/2581

import Foundation

let m = Int(readLine()!)!
let n = Int(readLine()!)!

var primes = [Bool](repeating: true, count: n+1)
primes[1] = false

let target = Int(sqrt(Double(n)))
for i in stride(from: 2, through: target, by: 1) {
    if primes[i] {
        var j = 2
        while i * j <= n {
            primes[i * j] = false
            j += 1
        }
    }
}

var result = [Int]()
for i in m ... n {
    if primes[i] {
        result.append(i)
    }
}

if result.isEmpty {
    print(-1)
} else {
    print(result.reduce(0,+))
    print(result[0])
}
