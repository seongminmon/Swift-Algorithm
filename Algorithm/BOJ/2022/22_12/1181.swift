//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/03.
//
// 1181 : 단어 정렬
// https://www.acmicpc.net/problem/1181

import Foundation

// 입력
let n = Int(readLine()!)!
var arr = [String]()
for _ in 0 ..< n {
    arr.append(readLine()!)
}

// 풀이
// 중복 제거
arr = Array(Set(arr))

// 정렬
arr.sort {
    if $0.count == $1.count {
        return $0 < $1
    } else {
        return $0.count < $1.count
    }
}

// 출력
var result = ""
for i in arr {
    result += "\(i)\n"
}
print(result)
