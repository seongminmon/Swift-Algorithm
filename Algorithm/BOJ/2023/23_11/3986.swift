//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 11/26/23.
//
// 3986 : 좋은 단어
// https://www.acmicpc.net/problem/3986

import Foundation

let n = Int(readLine()!)!
var words = [[String]]()
for _ in 0..<n {
    let input = readLine()!.map { String($0) }
    words.append(input)
}

var ans = 0
for word in words {
    var stack = [String]()
    for i in 0..<word.count {
        if !stack.isEmpty && stack.last! == word[i] {
            stack.removeLast()
        } else {
            stack.append(word[i])
        }
    }
    
    if stack.isEmpty {
        ans += 1
    }
}

print(ans)
