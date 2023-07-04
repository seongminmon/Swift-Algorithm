//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/21.
//
// 1911 : 흙길 보수하기
// https://www.acmicpc.net/problem/1911

import Foundation

// 입력
let nl = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,l) = (nl[0], nl[1])

var arr = [(Int,Int)]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    arr.append((input[0], input[1]))
}

// 풀이
arr.sort{ $0.0 < $1.0 }

var result = 0
var location = 0
for (start, end) in arr {
    if location >= end {
        continue
    }
    
    // 시작점
    location = max(location, start)
    
    // 널빤지 설치 개수
    var cnt = (end - location) / l
    if (end - location) % l > 0 {
        cnt += 1
    }
    
    location += l * cnt
    result += cnt
}

// 출력
print(result)
