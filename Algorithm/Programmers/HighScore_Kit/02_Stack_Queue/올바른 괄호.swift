//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/30.
//
// 올바른 괄호
// 스택/큐
// LV.2
// https://school.programmers.co.kr/learn/courses/30/lessons/12909

import Foundation

func solution(_ s:String) -> Bool {
    var stack = [Character]()
    for a in s {
        if a == "(" {
            stack.append(a)
        } else {
            if stack.isEmpty { return false }
            stack.removeLast()
        }
    }
    if !stack.isEmpty { return false }

    return true
}

// 풀이2
//func solution(_ s:String) -> Bool {
//    let str = Array(s)
//    var stack = 0
//    for a in str {
//        if a == "(" {
//            stack += 1
//        } else {
//            if stack == 0 { return false }
//            stack -= 1
//        }
//    }
//    if stack != 0 { return false }
//
//    return true
//}

print(solution("()()"))
print(solution("(())()"))
print(solution(")()("))
print(solution("(()("))
