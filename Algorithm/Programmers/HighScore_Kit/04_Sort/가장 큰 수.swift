//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/01.
//
// 가장 큰 수
// 정렬
// LV.2
// https://school.programmers.co.kr/learn/courses/30/lessons/42746

import Foundation

func solution(_ numbers:[Int]) -> String {
    var str = numbers.map { String($0) }
    str.sort { $0+$1 > $1+$0 }
    
    if str[0] == "0" { return "0" }
    return str.joined()
}

print(solution([6, 10, 2]))
print(solution([3, 30, 34, 5, 9]))
