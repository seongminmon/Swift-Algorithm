//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 1/2/25.
//
// [PCCP 기출문제] 4번 / 수식 복원하기
// PCCP 기출문제
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/340210

import Foundation

// base진법 -> 10진법
func translateTo10(_ num: Int, _ base: Int) -> Int {
    if num / 10 > 0 {
        return num / 10 * base + num % 10
    } else {
        return num
    }
}

// 10진법 -> base진법
func translateToBase(_ num: Int, _ base: Int) -> String {
    return String(num, radix: base)
}

// 진법(base)에 따라 계산
func calculate(_ a: Int, _ b: Int, _ symbol: String, _ base: Int) -> String {
    // a와 b를 10진법으로 전환
    let aNum = translateTo10(a, base)
    let bNum = translateTo10(b, base)
    
    // 10진법의 결과값을 다시 base 진법으로 변환 후 리턴
    let temp = symbol == "+" ? aNum + bNum : aNum - bNum
    return translateToBase(temp, base)
}

func solution(_ expressions:[String]) -> [String] {
    
    // 2~9진법 후보들
    var baseList = [Bool](repeating: true, count: 10)
    baseList[0] = false
    baseList[1] = false
    
    // 0. 등장하는 숫자들로 불가능한 진법 지우기 (전처리)
    var maxValue = expressions.joined().compactMap { Int(String($0)) }.max()!
    while maxValue >= 2 {
        baseList[maxValue] = false
        maxValue -= 1
    }
    
    // 답이 있는 경우와 X인 경우 분리
    var solved = [String]()
    var unsolved = [String]()
    for expression in expressions {
        if expression.contains("X") {
            unsolved.append(expression)
        } else {
            solved.append(expression)
        }
    }
    
    // 1. 답 있는 경우로 불가능한 진법 지우기
    for expression in solved {
        let input = expression.split(separator: " ").map { String($0) }
        let (a, symbol, b, c) = (Int(input[0])!, input[1], Int(input[2])!, input[4])
        
        // 결과가 C와 다르면 후보군에서 지우기
        for base in 2...9 {
            // 이미 후보군에서 지워진 진법이라면 패스
            if !baseList[base] { continue }
            
            // 진법(base)에 따라 계산
            let value = calculate(a, b, symbol, base)
            
            // 결과가 c와 다르면 진법 후보군에서 지우기
            if value != c {
                baseList[base] = false
            }
        }
    }
    
    // 2. X값 구하기
    var ans = [String]()
    for expression in unsolved {
        var input = expression.split(separator: " ").map { String($0) }
        let (a, symbol, b) = (Int(input[0])!, input[1], Int(input[2])!)
        
        var temp = ""
        for base in 2...9 {
            // 후보군에서 지워진 진법이면 패스
            if !baseList[base] { continue }
            
            // 진법(base)에 따라 계산
            let value = calculate(a, b, symbol, base)
            
            if temp.isEmpty {
                // 첫 갱신
                temp = value
            } else {
                // 이후 기록된 값과 value가 다르면 ?로 기록
                if temp != value {
                    temp = "?"
                    break
                }
            }
        }
        
        // 답 갱신
        input[4] = temp
        ans.append(input.joined(separator: " "))
    }
    
    return ans
}

print(solution(["14 + 3 = 17", "13 - 6 = X", "51 - 5 = 44"]))
// ["13 - 6 = 5"]
print(solution(["1 + 1 = 2", "1 + 3 = 4", "1 + 5 = X", "1 + 2 = X"]))
// ["1 + 5 = ?", "1 + 2 = 3"]
print(solution(["10 - 2 = X", "30 + 31 = 101", "3 + 3 = X", "33 + 33 = X"]))
// ["10 - 2 = 4", "3 + 3 = 10", "33 + 33 = 110"]
print(solution(["2 - 1 = 1", "2 + 2 = X", "7 + 4 = X", "5 - 5 = X"]))
// ["2 + 2 = 4", "7 + 4 = ?", "5 - 5 = 0"]
print(solution(["2 - 1 = 1", "2 + 2 = X", "7 + 4 = X", "8 + 4 = X"]))
// ["2 + 2 = 4", "7 + 4 = 12", "8 + 4 = 13"]
