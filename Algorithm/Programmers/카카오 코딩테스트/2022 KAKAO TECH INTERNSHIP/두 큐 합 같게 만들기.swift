//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/17.
//
// 두 큐 합 같게 만들기
// 2022 KAKAO TECH INTERNSHIP
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/118667

import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let totalQueue = queue1 + queue2
    let halfSum = totalQueue.reduce(0,+) / 2
    
    var sum1 = queue1.reduce(0,+)
    var start = 0
    var end = queue1.count
    
    var cnt = 0
    while end < totalQueue.count && sum1 != halfSum {
        if sum1 < halfSum {
            sum1 += totalQueue[end]
            end += 1
        } else {
            sum1 -= totalQueue[start]
            start += 1
        }
        cnt += 1
    }
    return sum1 != halfSum ? -1 : cnt
}

print(solution([3,2,7,2], [4,6,5,1]))
print(solution([1,2,1,2], [1,10,1,2]))
print(solution([1,1], [1,5]))
