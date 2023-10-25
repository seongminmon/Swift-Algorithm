//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/26.
//
// 호텔 방 배정
// 2019 카카오 개발자 겨울 인턴십
// Lv. 4
// https://school.programmers.co.kr/learn/courses/30/lessons/64063

import Foundation

func solution(_ k:Int64, _ room_number:[Int64]) -> [Int64] {
    var dict = [Int64: Int64]()
    func find(_ num: Int64) -> Int64 {
        guard let next = dict[num] else {
            dict[num] = num + 1
            return num
        }
        let nextNum = find(next)
        dict[num] = nextNum + 1
        return nextNum
    }
    return room_number.map { find($0) }
}

print(solution(10, [1,3,4,1,3,1]))
