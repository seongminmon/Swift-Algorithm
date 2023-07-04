//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/25.
//
// 2195 : 문자열 복사
// https://www.acmicpc.net/problem/2195

import Foundation

// 입력
var s = readLine()!.map{ String($0) }
var p = readLine()!.map{ String($0) }

// 풀이
var result = 0
var i = 0
while i < p.count {
    var cnt = 0
    for j in 0 ..< s.count {
        var temp = 0
        while i+temp < p.count, j+temp < s.count,
              p[i+temp] == s[j+temp] {
            temp += 1
        }
        cnt = max(cnt, temp)
    }
    i += cnt
    result += 1
}

// 출력
print(result)
