//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/28.
//
// 1522 : 문자열 교환
// https://www.acmicpc.net/problem/1522

import Foundation

// 입력
let s = readLine()!.map{ String($0) }

// 풀이
var aCnt = 0
for i in 0 ..< s.count {
    if s[i] == "a" {
        aCnt += 1
    }
}

var result = Int(1e9)
for i in 0 ..< s.count {
    var cnt = 0
    for j in i ..< i + aCnt {
        if s[j % s.count] == "b" {
            cnt += 1
        }
    }
    result = min(result, cnt)
}

// 출력
print(result)
