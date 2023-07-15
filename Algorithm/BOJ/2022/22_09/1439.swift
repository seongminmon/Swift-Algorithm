//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/09/24.
//
// 1439 : 뒤집기
// https://www.acmicpc.net/problem/1439

import Foundation

// 입력
var s = readLine()!.map {Int(String($0))!}

// 풀이
var str = [s[0]]
for i in 0 ..< s.count - 1 {
    if s[i] != s[i+1] {
        str.append(s[i+1])
    }
}

var cnt = 0
for i in 0 ..< str.count - 1 {
    if str[i] != str[i+1] {
        str[i+1] = str[i]
        cnt += 1
    }
}

// 출력
print(cnt)
