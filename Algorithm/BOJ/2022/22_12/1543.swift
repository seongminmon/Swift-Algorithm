//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/22.
//
// 1543 : 문서 검색
// https://www.acmicpc.net/problem/1543

import Foundation

// 입력
let str = readLine()!.map{ String($0) }
let target = readLine()!.map{ String($0) }

// 풀이
var idx = 0
var count = 0
while idx + target.count <= str.count {
    if Array(str[idx ..< idx + target.count]) == target {
        idx += target.count
        count += 1
    } else {
        idx += 1
    }
}

// 출력
print(count)
