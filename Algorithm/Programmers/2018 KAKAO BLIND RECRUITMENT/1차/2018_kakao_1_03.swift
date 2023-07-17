//
//  ㅁㄴㅇㄹ.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/09.
//
// [1차] 캐시
// 2018 KAKAO BLIND RECRUITMENT
// Lv. 2
// https://school.programmers.co.kr/learn/courses/30/lessons/17680

import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    if cacheSize == 0 { return cities.count * 5 }

    var cities = cities.map{ $0.uppercased() }
    var cache = [String](repeating: "", count: cacheSize)
    var times = [Int](repeating: 0, count: cacheSize)
    var result = 0

    for city in cities {
        var isHit = false
        var maxCnt = 0
        var targetIdx = 0

        for i in 0 ..< cacheSize {
            if cache[i] == city {
                times[i] = 0
                isHit = true
            } else {
                if maxCnt < times[i] {
                    maxCnt = times[i]
                    targetIdx = i
                }
                times[i] += 1
            }
        }

        if isHit {
            result += 1
        } else {
            cache[targetIdx] = city
            times[targetIdx] = 0
            result += 5
        }
    }

    return result
}

print(solution(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]))
print(solution(3, ["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"]))
print(solution(2, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]))
print(solution(5, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]))
print(solution(2, ["Jeju", "Pangyo", "NewYork", "newyork"]))
print(solution(0, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA"]))
