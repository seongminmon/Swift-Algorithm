//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/10.
//
// [1차] 다트 게임
// 2018 KAKAO BLIND RECRUITMENT
// Lv. 1
// https://school.programmers.co.kr/learn/courses/30/lessons/17682

import Foundation

// 풀이 1
//func solution(_ dartResult:String) -> Int {
//    let dartResult = Array(dartResult)
//    var stack = [Int]()
//    var numstr = ""
//    for i in 0..<dartResult.count {
//        let ch = dartResult[i]
//        if ch.isNumber {
//            if !numstr.isEmpty {
//                if numstr.count == 1 {
//                    if !(numstr == "1") || !(ch == "0") {
//                        numstr = ""
//                    }
//                } else {
//                    numstr = ""
//                }
//            }
//            numstr += String(ch)
//        } else if ch == "S" || ch == "D" || ch == "T" {
//            var num = Int(numstr)!
//            if ch == "D" {
//                num = num * num
//            } else if ch == "T" {
//                num = num * num * num
//            }
//            stack.append(num)
//        } else {
//            var num = stack.removeLast()
//            if ch == "*" {
//                if !stack.isEmpty {
//                    stack[stack.count-1] *= 2
//                }
//                num *= 2
//            } else if ch == "#" {
//                num = -num
//            }
//            stack.append(num)
//        }
//    }
//
//    return stack.reduce(0,+)
//}

// 풀이 2
func solution(_ dartResult:String) -> Int {
    let numbers = dartResult.split(whereSeparator: { $0.isLetter || $0 == "#" || $0 == "*" })
    let letters = dartResult.split(whereSeparator: { $0.isNumber })
    
    var stack = [Int]()
    for i in 0..<3 {
        var num = Int(numbers[i])!
        
        switch letters[i].first! {
        case "D": num = num * num
        case "T": num = num * num * num
        default: break
        }
        
        if letters[i].count == 2 {
            switch letters[i].last! {
            case "*":
                num *= 2
                if i > 0 { stack[i-1] *= 2 }
            case "#":
                num = -num
            default: break
            }
        }
        
        stack.append(num)
    }
    
    return stack.reduce(0,+)
}

print(solution("1S2D*3T"))
print(solution("1D2S#10S"))
print(solution("1D2S0T"))
print(solution("1S*2T*3S"))
print(solution("1D#2S*3S"))
print(solution("1T2D3D#"))
print(solution("1D2S3T*"))
