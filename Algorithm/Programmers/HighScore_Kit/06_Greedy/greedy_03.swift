//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/14.
//
// 큰 수 만들기
// 탐욕법(Greedy)
// LV.2
// https://school.programmers.co.kr/learn/courses/30/lessons/42883

import Foundation

func solution(_ number: String, _ k:Int) -> String {
    let n = number.count
    let number = number.map { String($0) }

    var stack = [String]()
    var idx = 0
    var cnt = 0
    while idx < n && cnt < k {
        if !stack.isEmpty && stack.last! < number[idx] {
            stack.removeLast()
            cnt += 1
        } else {
            stack.append(number[idx])
            idx += 1
        }
    }

    if cnt == k {
        stack += number[idx...]
    } else {
        stack = Array(stack[..<(n-k)])
    }

    return stack.joined()
}

print(solution("1924", 2))
print(solution("1231234", 3))
print(solution("4177252841", 4))
print(solution("9929191", 5))
