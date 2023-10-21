//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/21.
//
// 점프와 순간 이동
// Summer/Winter Coding(~2018)
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/12980

import Foundation

func solution(_ n:Int) -> Int {
    var result = 0
    var n = n
    
    while n != 0 {
        if n % 2 == 0 {
            n /= 2
        } else {
            n -= 1
            result += 1
        }
    }
    
    return result
}

print(solution(5))
print(solution(6))
print(solution(5000))
