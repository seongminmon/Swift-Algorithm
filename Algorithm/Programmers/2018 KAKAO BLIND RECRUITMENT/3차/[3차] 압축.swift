//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/15.
//
// [3차] 압축
// 2018 KAKAO BLIND RECRUITMENT
// Lv. 2
// https://school.programmers.co.kr/learn/courses/30/lessons/17684

import Foundation

func solution(_ msg:String) -> [Int] {
    let AScalar = "A".unicodeScalars.first!.value
    let alphabet = (0..<26).map { String(UnicodeScalar(AScalar + $0)!) }
    var dict = [String: Int]()
    for i in 0..<26 { dict[alphabet[i]] = i+1 }
    
    let msg = msg.map { String($0) }
    var result = [Int]()
    var nextNum = 27
    
    var i = 0
    while i < msg.count {
        var str = msg[i]
        var j = i
        while dict[str] != nil {
            if j == msg.count-1 { break }
            j += 1
            str += msg[j]
        }
        
        if dict[str] == nil {
            dict[str] = nextNum
            nextNum += 1
            str.removeLast()
            result.append(dict[str]!)
            i = j
        } else {
            result.append(dict[str]!)
            break
        }
    }
    
    return result
}

print(solution("KAKAO"))
print(solution("TOBEORNOTTOBEORTOBEORNOT"))
print(solution("ABABABABABABABAB"))
