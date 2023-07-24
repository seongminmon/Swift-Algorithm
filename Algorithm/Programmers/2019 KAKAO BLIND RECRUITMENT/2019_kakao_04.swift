//
//  asdf.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/22.
//
// 무지의 먹방 라이브
// 2019 KAKAO BLIND RECRUITMENT
// Lv.4
// https://school.programmers.co.kr/learn/courses/30/lessons/42891

import Foundation

func solution(_ food_times:[Int], _ k:Int64) -> Int {
    // 음식이 안 남는 경우
    let sum = food_times.reduce(0,+)
    if k >= sum {
        return -1
    }
    
    var f = food_times.enumerated().sorted { $0.element > $1.element }
    var k = k
    var last = 0
    while k >= Int64(f.count * (f.last!.element - last)) {
        let Min = f.removeLast().element
        k -= Int64((f.count + 1) * (Min - last))
        last = Min
    }
    
    f.sort { $0.offset < $1.offset }
    let result = f[Int(k) % f.count].offset + 1
    
    return result
}

print(solution([3, 1, 2], 5))
