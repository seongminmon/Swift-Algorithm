//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/25.
//
// 문자열 압축
// 2020 KAKAO BLIND RECRUITMENT
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/60057

import Foundation

func compress(_ str: String, _ num: Int) -> Int {
    let str = Array(str)
    var total = str.count
    var repeatCnt = 1
    var idx = 0
    while idx < str.count {
        if idx+num*2 <= str.count && str[idx..<idx+num] == str[idx+num..<idx+num*2] {
            // 반복 횟수 증가
            repeatCnt += 1
            // 압축된만큼 감소
            total -= num
            // 처음이면 2 표시하기 위해서 total 증가
            if repeatCnt == 2 {
                total += 1
            }
            // 반복 횟수 자릿수 바뀔 시 total 증가
            if [10, 100, 1000].contains(repeatCnt) {
                total += 1
            }
        } else {
            // 반복 횟수 초기화
            repeatCnt = 1
        }
        idx += num
    }
    return total
}

func solution(_ s: String) -> Int {
    var ans = s.count
    for i in 1...(s.count / 2 + 1) {
        ans = min(ans, compress(s, i))
    }
    return ans
}

print(solution("aabbaccc"))
print(solution("ababcdcdababcdcd"))
print(solution("abcabcdede"))
print(solution("abcabcabcabcdededededede"))
print(solution("xababcdcdababcdcd"))
print(solution("a"))
