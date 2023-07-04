//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/06.
//
// 2609 : 최대공약수와 최소공배수
// https://www.acmicpc.net/problem/2609

import Foundation

let ab = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (a,b) = (ab[0] > ab[1]) ? (ab[0], ab[1]) : (ab[1], ab[0])

func gcd(_ a: Int, _ b: Int) -> Int {
    return b != 0 ? gcd(b, a % b) : a
}

let ans = gcd(a, b)
print(ans)
print(a * b / ans)
