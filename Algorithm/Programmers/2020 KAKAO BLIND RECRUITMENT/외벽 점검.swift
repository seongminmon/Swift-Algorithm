//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/29.
//
// 외벽 점검
// 2020 KAKAO BLIND RECRUITMENT
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/60062

import Foundation

func solution(_ n:Int, _ weak:[Int], _ dist:[Int]) -> Int {
    let dist = dist.sorted(by: >)
    
    var weakList = Set<[Int]>()
    weakList.insert(weak)
    
    for i in 0..<dist.count {
        var newWeakList = Set<[Int]>()
        for nowWeak in weakList {
            for start in nowWeak {
                let end = (start + dist[i]) % n
                
                var newWeak = [Int]()
                if start < end {
                    newWeak = nowWeak.filter { !(start...end).contains($0) }
                } else {
                    newWeak = nowWeak.filter { (end+1..<start).contains($0) }
                }
                
                // 종료 조건
                if newWeak.isEmpty { return i+1 }
                
                newWeakList.insert(newWeak)
            }
        }
        weakList = newWeakList
    }
    
    return -1
}

print(solution(
    12,
    [1, 5, 6, 10],
    [1, 2, 3, 4]
))
print(solution(
    12,
    [1, 3, 4, 9, 10],
    [3, 5, 7]
))
print(solution(
    200,
    [1],
    [1]
))
