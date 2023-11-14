//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/11/13.
//
// 2812 : 크게 만들기
// https://www.acmicpc.net/problem/2812

import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,k) = (nk[0], nk[1])
let arr = readLine()!.map { Int(String($0))! }

var stack = [Int]()
var cnt = 0
for i in 0..<n {
    while !stack.isEmpty && stack.last! < arr[i] && cnt < k {
        stack.removeLast()
        cnt += 1
    }
    stack.append(arr[i])
}

while cnt < k {
    stack.removeLast()
    cnt += 1
}

print(stack.map { String($0) }.joined())
