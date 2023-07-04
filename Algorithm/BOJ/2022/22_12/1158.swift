//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/04.
//
// 1158 : 요세푸스 문제
// https://www.acmicpc.net/problem/1158

import Foundation

// 입력
let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,k) = (nk[0], nk[1])

// 풀이
var arr = Array(1 ... n)
var idx = 0
var result = ""
while !arr.isEmpty {
    idx = (idx + k - 1) % arr.count
    let a = arr.remove(at: idx)
    result += "\(a), "
}
result.removeLast()
result.removeLast()

// 출력
print("<\(result)>")
