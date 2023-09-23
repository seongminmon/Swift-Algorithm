//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/09/18.
//
// 1339 : 단어 수학
// https://www.acmicpc.net/problem/1339

import Foundation

let n = Int(readLine()!)!
var words = [[String]]()
for _ in 0..<n {
    let word = readLine()!.map { String($0) }
    words.append(word)
}

var dict = [String: Int]()
for i in 0..<n {
    for j in 0..<words[i].count {
        let value = Int(pow(10, Double(words[i].count-j-1)))
        dict[words[i][j], default: 0] += value
    }
}

let sortedValue = dict.values.sorted { $0 > $1 }
var ans = 0
var num = 9
for value in sortedValue {
    ans += value * num
    num -= 1
}
print(ans)
