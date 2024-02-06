//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2/6/24.
//
// 1931 : 회의실 배정
// https://www.acmicpc.net/problem/1931

import Foundation

let n = Int(readLine()!)!
var arr = [(Int,Int)]()   // (시작시간, 종료시간)
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append((input[0], input[1]))
}

// 종료 시간 기준 오름차순 정렬
// 같다면 시작 시간 기준 오름차순 정렬
arr.sort {
    if $0.1 == $1.1 {
        return $0.0 < $1.0
    } else {
        return $0.1 < $1.1
    }
}

var end = 0
var ans = 0
for (s,e) in arr {
    if end <= s {
        end = e
        ans += 1
    }
}
print(ans)
