//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/01.
//
// 신규 아이디 추천
// 2021 KAKAO BLIND RECRUITMENT
// Lv.1
// https://school.programmers.co.kr/learn/courses/30/lessons/72410

import Foundation

func solution(_ new_id:String) -> String {
    // 1.
    var str = Array(new_id.lowercased())
    // 2.
    str = str.filter { $0.isLetter || $0.isNumber || $0 == "-" || $0 == "_" || $0 == "." }
    // 4.
    while str.first == "." {
        str.removeFirst()
    }
    while str.last == "." {
        str.removeLast()
    }
    // 3.
    for i in 0..<str.count {
        while i+1 < str.count && str[i] == "." && str[i+1] == "." {
            str.remove(at: i+1)
        }
    }
    // 5.
    if str.isEmpty {
        str = Array("a")
    }
    // 6.
    if str.count > 15 {
        str = Array(str[0..<15])
    }
    if str.last == "." {
        str.removeLast()
    }
    // 7.
    while str.count <= 2 {
        str += String(str.last!)
    }
    return String(str)
}

print(solution("...!@BaT#*..y.abcdefghijklm"))
print(solution("z-+.^."))
print(solution("=.="))
print(solution("123_.def"))
print(solution("abcdefghijklmn.p"))
    
