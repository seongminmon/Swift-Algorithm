//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/16.
//
// [3차] n진수 게임
// 2018 KAKAO BLIND RECRUITMENT
// Lv. 2
// https://school.programmers.co.kr/learn/courses/30/lessons/17687

import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var arr = [String]()
    var num = 0
    while arr.count < t*m {
        let s = String(num, radix: n).uppercased().map { String($0) }
        arr += s
        num += 1
    }
    
    var result = ""
    var idx = p-1
    while result.count < t {
        result += arr[idx]
        idx += m
    }
    return result
}

print(solution(2, 4, 2, 1))
print(solution(16, 16, 2, 1))
print(solution(16, 16, 2, 2))
