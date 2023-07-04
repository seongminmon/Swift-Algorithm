//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/06.
//
// 2485 : 가로수
// https://www.acmicpc.net/problem/2485

import Foundation

// 입력
let n = Int(readLine()!)!
var arr = [Int]()
for _ in 0 ..< n {
    arr.append(Int(readLine()!)!)
}

// 풀이
func makeGcd(_ n1: Int, _ n2: Int) -> Int {
    let (a,b) = n1 > n2 ? (n1, n2) : (n2, n1)
    return b == 0 ? a : makeGcd(b, a%b)
}

var gcd = makeGcd(arr[1] - arr[0], arr[2] - arr[1])
for i in 2 ..< n-1 {
    gcd = makeGcd(gcd, arr[i+1] - arr[i])
}

var result = ((arr[n-1] - arr[0]) / gcd) - (n - 1)

// 출력
print(result)
