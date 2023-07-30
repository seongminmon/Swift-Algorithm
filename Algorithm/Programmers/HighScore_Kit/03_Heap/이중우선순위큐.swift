//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/01.
//
// 이중우선순위큐
// 힙(Heap)
// LV.3
// https://school.programmers.co.kr/learn/courses/30/lessons/42628

import Foundation

func solution(_ operations:[String]) -> [Int] {
    var queue = [Int]()
    for operation in operations {
        let op = operation.split(separator: " ").map{ String($0) }
        
        if op[0] == "I" {
            queue.append(Int(op[1])!)
        } else {
            if queue.isEmpty { continue }
            
            var target = 0
            if op[1] == "1" {
                target = queue.max()!
            } else {
                target = queue.min()!
            }
            queue.remove(at: queue.firstIndex(of: target)!)
        }
    }
    
    return [queue.max() ?? 0, queue.min() ?? 0]
}

print(solution(["I 16", "I -5643", "D -1", "D 1", "D 1", "I 123", "D -1"]))
print(solution(["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333"]))
