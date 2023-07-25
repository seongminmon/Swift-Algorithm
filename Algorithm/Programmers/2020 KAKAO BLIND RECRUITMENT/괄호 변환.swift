//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/25.
//
// 괄호 변환
// 2020 KAKAO BLIND RECRUITMENT
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/60058

import Foundation

func solution(_ p:String) -> String {
    // 1.
    if p == "" { return "" }
    
    // 2.
    var cnt = 0
    var idx = p.startIndex
    
    cnt += String(p[idx]) == "(" ? 1 : -1
    idx = p.index(after: idx)
    
    while cnt != 0 {
        cnt += String(p[idx]) == "(" ? 1 : -1
        idx = p.index(after: idx)
    }
    
    var u = String(p[..<idx])
    let v = String(p[idx...])
    
    // 3.
    if u.first! == "(" {
        return u + solution(v)
    } else {
    // 4.
        u.removeFirst()
        u.removeLast()
        return "(\(solution(v)))\(u.map { String($0) == "(" ? ")" : "(" }.joined())"
    }
}

print(solution("(()())()"))
print(solution(")("))
print(solution("()))((()"))
