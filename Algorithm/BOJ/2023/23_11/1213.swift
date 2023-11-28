//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 11/28/23.
//
// 1213 : 팰린드롬 만들기
// https://www.acmicpc.net/problem/1213

import Foundation

let str = readLine()!.map { String($0) }

var dict = [String: Int]()
for s in str {
    dict[s, default: 0] += 1
}

var oddCnt = 0
var oddAlpha = ""
for (key, value) in dict.sorted(by: { $0.key < $1.key }) {
    if value % 2 == 1 {
        oddCnt += 1
        oddAlpha = key
    }
}

var ans = ""
if str.count % 2 == 1 && oddCnt == 1 {
    dict[oddAlpha]! -= 1
    oddCnt -= 1
    ans += oddAlpha
}

if oddCnt == 0 {
    for (key, value) in dict.sorted(by: { $0.key > $1.key }) {
        let temp = String(repeating: key, count: value/2)
        ans = temp + ans + temp
    }
    print(ans)
} else {
    print("I'm Sorry Hansoo")
}
