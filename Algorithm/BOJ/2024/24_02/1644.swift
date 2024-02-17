//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2/6/24.
//
// 1644 : 소수의 연속합
// https://www.acmicpc.net/problem/1644

import Foundation

let n = Int(readLine()!)!

var primes = [Int]()
var isPrime = [Bool](repeating: true, count: 4_000_001)
for i in stride(from: 2, through: n, by: 1) {
    if isPrime[i] {
        primes.append(i)
        for j in stride(from: i+i, through: n, by: i) {
            isPrime[j] = false
        }
    }
}

var sumPrimes = [Int](repeating: 0, count: primes.count+1)
for i in stride(from: 1, through: primes.count, by: 1) {
    sumPrimes[i] = sumPrimes[i-1] + primes[i-1]
}

var cnt = 0
var s = 1
var e = 1
while s <= e, e < sumPrimes.count {
    let sum = sumPrimes[e] - sumPrimes[s-1]
    if sum == n {
        cnt += 1
        s += 1
    } else if sum < n {
        e += 1
    } else {
        s += 1
    }
}
print(cnt)
