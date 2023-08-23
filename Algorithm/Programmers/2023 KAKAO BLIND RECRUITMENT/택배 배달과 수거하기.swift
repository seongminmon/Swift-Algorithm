//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/22.
//
// 택배 배달과 수거하기
// 2023 KAKAO BLIND RECRUITMENT
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/150369

import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var result: Int64 = 0
    var truck = (0, 0)
    for i in stride(from: n-1, through: 0, by: -1) {
        // 뺄 수 있을 때까지 추가
        while truck.0 < deliveries[i] || truck.1 < pickups[i] {
            truck.0 += cap
            truck.1 += cap
            // 거리 추가
            result += Int64((i+1) * 2)
        }
        // 배달, 수거
        truck.0 -= deliveries[i]
        truck.1 -= pickups[i]
    }
    return result
}

print(solution(4, 5, [1, 0, 3, 1, 2], [0, 3, 0, 4, 0]))
print(solution(2, 7, [1, 0, 2, 0, 1, 0, 2], [0, 2, 0, 1, 0, 2, 0]))
