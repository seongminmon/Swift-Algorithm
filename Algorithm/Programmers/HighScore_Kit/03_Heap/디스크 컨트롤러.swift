//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/01.
//
// 디스크 컨트롤러
// 힙(Heap)
// LV.3
// https://school.programmers.co.kr/learn/courses/30/lessons/42627

import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    let n = jobs.count
    var jobs = jobs.sorted{ $0[0] > $1[0] }
    
    var result = 0
    var currentTime = 0
    var queue = [(Int,Int)]()
    var cnt = 0
    
    while cnt < n {
        while !jobs.isEmpty && jobs.last![0] <= currentTime {
            let job = jobs.removeLast()
            queue.append((job[0], job[1]))
        }
        
        if queue.isEmpty {
            currentTime += 1
            continue
        }
        
        queue.sort{ $0.1 > $1.1 }
        let now = queue.removeLast()
        cnt += 1
        currentTime += now.1
        result += currentTime - now.0
    }
    
    return result / n
}

print(solution([[0, 3], [1, 9], [2, 6]]))
