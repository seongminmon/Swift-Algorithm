//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/04.
//
// 숫자 문자열과 영단어
// 2021 카카오 채용연계형 인턴십
// Lv. 1
// https://school.programmers.co.kr/learn/courses/30/lessons/81301

import Foundation

// 풀이 1
func solution(_ s:String) -> Int {
    var result = ""
    func isComplete(_ numStr: String) -> Bool {
        switch numStr {
        case "zero":
            result += "0"
        case "one":
            result += "1"
        case "two":
            result += "2"
        case "three":
            result += "3"
        case "four":
            result += "4"
        case "five":
            result += "5"
        case "six":
            result += "6"
        case "seven":
            result += "7"
        case "eight":
            result += "8"
        case "nine":
            result += "9"
        default:
            return false
        }
        return true
    }

    let s = Array(s)
    var i = 0
    while i < s.count {
        if s[i].isNumber {
            result += String(s[i])
            i += 1
        } else {
            var numStr = ""
            while i < s.count && !s[i].isNumber {
                numStr += String(s[i])
                i += 1
                if isComplete(numStr) { break }
            }
        }
    }

    return Int(result)!
}

// 풀이 2
//func solution(_ s:String) -> Int {
//    let arr = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
//    var ans = s
//    for i in 0..<arr.count {
//        ans = ans.replacingOccurrences(of: arr[i], with: String(i))
//    }
//    return Int(ans)!
//}

print(solution("one4seveneight"))
print(solution("23four5six7"))
print(solution("2three45sixseven"))
print(solution("123"))
