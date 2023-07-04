//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/04.
//
// 10867 : 중복 빼고 정렬하기
// https://www.acmicpc.net/problem/10867

import Foundation

// 입력
let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

// 풀이
arr = Array(Set(arr))
arr.sort()

// 출력
var result = ""
for i in arr {
    result += "\(i) "
}
print(result)
