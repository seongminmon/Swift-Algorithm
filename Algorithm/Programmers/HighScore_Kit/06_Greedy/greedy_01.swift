//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/10.
//
// 체육복
// 탐욕법(Greedy)
// LV.1
// https://school.programmers.co.kr/learn/courses/30/lessons/42862?language=swift

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var students = [Int](repeating: 1, count: n)
    for l in lost {
        students[l-1] -= 1
    }
    for r in reserve {
        students[r-1] += 1
    }
    
    for i in 0..<n {
        if students[i] != 0 { continue }
        
        if i == 0 {
            if students[i+1] == 2 {
                students[i] = 1
                students[i+1] = 1
            }
        } else if i == n-1 {
            if students[i-1] == 2 {
                students[i] = 1
                students[i-1] = 1
            }
        } else {
            if students[i-1] == 2 {
                students[i] = 1
                students[i-1] = 1
            } else if students[i+1] == 2 {
                students[i] = 1
                students[i+1] = 1
            }
        }
    }
    
    return students.filter { $0 >= 1 }.count
}

print(solution(
    5,
    [2, 4],
    [1, 3, 5]
))
print(solution(
    5,
    [2, 4],
    [3]
))
print(solution(
    3,
    [3],
    [1]
))
