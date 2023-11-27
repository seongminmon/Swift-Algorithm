//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 11/27/23.
//
// 10808 : 알파벳 개수
// https://www.acmicpc.net/problem/10808

import Foundation

let str = readLine()!
var ans = [Int](repeating: 0, count: 26)
for s in str {
    let index = Int(s.asciiValue! - Character("a").asciiValue!)
    ans[index] += 1
}

for i in ans {
    print(i, terminator: " ")
}
