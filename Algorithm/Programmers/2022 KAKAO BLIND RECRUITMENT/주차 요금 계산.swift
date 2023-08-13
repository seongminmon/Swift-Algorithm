//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/13.
//
// 주차 요금 계산
// 2022 KAKAO BLIND RECRUITMENT
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/92341

import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    // 차량번호: (시간, InOut)
    var dict = [String: [(Int, String)]]()
    
    // "시각 차량번호 내역"
    for record in records {
        let str = record.split(separator: " ").map { String($0) }
        let time = str[0].split(separator: ":").map { Int(String($0))! }
        dict[str[1], default: []].append((time[0]*60 + time[1], str[2]))
    }
    
    // (차량번호, 비용)
    var result = [(String, Int)]()
    for (key, value) in dict {
        var totalTime = 0
        for i in 0..<value.count {
            if value[i].1 == "OUT" {
                totalTime += value[i].0 - value[i-1].0
            }
        }
        if value.last!.1 == "IN" {
            totalTime += 24 * 60 - 1 - value.last!.0
        }
        
        // [기본시간, 기본요금, 단위시간, 단위요금]
        var cost = fees[1]
        if totalTime > fees[0] {
            totalTime -= fees[0]

            cost += totalTime / fees[2] * fees[3]
            if totalTime % fees[2] > 0 {
                cost += fees[3]
            }
        }
        result.append((key, cost))
    }
    
    return result.sorted { $0.0 < $1.0 }.map { $0.1 }
}

print(solution([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]))
print(solution([120, 0, 60, 591], ["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"]))
print(solution([1, 461, 1, 10], ["00:00 1234 IN"]))
