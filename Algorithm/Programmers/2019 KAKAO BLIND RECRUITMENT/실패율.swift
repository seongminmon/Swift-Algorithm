//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/19.
//
// 실패율
// 2019 KAKAO BLIND RECRUITMENT
// Lv.1
// https://school.programmers.co.kr/learn/courses/30/lessons/42889

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var chellenging = [Int](repeating: 0, count: N+2)
    for stage in stages {
        chellenging[stage] += 1
    }
    
    var cleared = [Int](repeating: 0, count: N+1)
    var sum = chellenging[N+1]
    for i in stride(from: N, through: 1, by: -1) {
        sum += chellenging[i]
        cleared[i] = sum
    }
    
    var failure = [(Float,Int)](repeating: (0,0), count: N+1)
    for i in 1 ... N {
        failure[i].0 = Float(chellenging[i]) / Float(cleared[i])
        failure[i].1 = i
    }
    
    // 실패율은 내림차순, 스테이지는 오름차순 정렬
    failure.sort { $0.0 > $1.0 || $0.1 < $1.1 }

    var result = [Int]()
    for i in 0 ... N {
        if failure[i].1 != 0 {
            result.append(failure[i].1)
        }
    }
    
    return result
}

print(solution(5, [2, 1, 2, 6, 2, 4, 3, 3]))
print(solution(4, [4,4,4,4,4]))
