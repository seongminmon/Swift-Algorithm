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

// 풀이 1: 아스키 코드
//var ans = [Int](repeating: 0, count: 26)
//for s in str {
//    let index = Int(s.asciiValue! - Character("a").asciiValue!)
//    ans[index] += 1
//}
//
//for i in ans {
//    print(i, terminator: " ")
//}

// 풀이 2: dictionary
var dict = [Character: Int]()
for s in str {
    dict[s, default: 0] += 1
}
print(dict)
