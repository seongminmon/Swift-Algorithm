//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/06.
//
// 소수 찾기
// 완전탐색
// LV.2
// https://school.programmers.co.kr/learn/courses/30/lessons/42839

import Foundation

func solution(_ numbers:String) -> Int {
    let numbers = numbers.map{ String($0) }
    let n = numbers.count
    
    var numSet = Set<Int>()
    var visited = [Bool](repeating: false, count: n)
    
    func permutation(_ arr: [String], _ cnt: Int, _ pCnt: Int) {
        if cnt == pCnt {
            numSet.insert(Int(arr.joined())!)
            return
        }
        
        for i in 0..<n {
            if !visited[i] {
                visited[i] = true
                permutation(arr + [numbers[i]], cnt+1, pCnt)
                visited[i] = false
            }
        }
    }
    
    for i in 1...n {
        visited = [Bool](repeating: false, count: n)
        permutation([], 0, i)
    }
    
    return numSet.filter { isPrime($0) }.count
}

func isPrime(_ num: Int) -> Bool {
    if num < 2 { return false }
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    return true
}

print(solution("17"))
print(solution("011"))
