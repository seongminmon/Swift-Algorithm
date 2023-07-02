//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/01.
//
// 수식 최대화
// 2020 카카오 인턴십
// Lv. 2
// https://school.programmers.co.kr/learn/courses/30/lessons/67257

import Foundation

func solution(_ expression:String) -> Int64 {
    let numbers = expression.components(separatedBy: ["+", "-", "*"]).map { Int64($0)! }
    let ops = Array(expression.filter { !$0.isNumber })
    
    var result: Int64 = 0
    let operation = ["+", "-", "*"]
    var visited = [Bool](repeating: false, count: 3)
    func permutation(_ depth: Int, _ priority: [Character]) {
        if depth == 3 {
            result = max(result, makeValue(priority))
            return
        }
        
        for i in 0..<3 {
            if !visited[i] {
                visited[i] = true
                permutation(depth+1, priority + operation[i])
                visited[i] = false
            }
        }
    }
    
    func makeValue(_ priority: [Character]) -> Int64 {
        var numbers = numbers
        var ops = ops
        for target in priority {
            while let index = ops.firstIndex(of: target) {
                numbers[index] = calculate(ops[index], numbers[index], numbers[index+1])
                numbers.remove(at: index+1)
                ops.remove(at: index)
            }
        }
        
        return abs(numbers[0])
    }
    
    func calculate(_ op: Character, _ num1: Int64, _ num2: Int64) -> Int64 {
        switch op {
            case "+": return num1 + num2
            case "-": return num1 - num2
            default: return num1 * num2
        }
    }
    
    permutation(0, [])
    
    return result
}

print(solution("100-200*300-500+20"))
print(solution("50*6-3*2"))
