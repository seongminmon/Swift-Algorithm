//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 3/23/24.
//
// 가장 많이 받은 선물
// 2024 KAKAO WINTER INTERNSHIP
// Lv.1
// https://school.programmers.co.kr/learn/courses/30/lessons/258712

import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var dictArr = [String: [String: Int]]()
    var dict = [String: Int]()
    var rate = [String: Int]()
    var result = [String: Int]()
    
    for friend in friends {
        dict[friend] = 0
        rate[friend] = 0
        result[friend] = 0
    }
    
    for friend in friends {
        dictArr[friend] = dict
    }
    
    for i in 0..<gifts.count {
        let ab = gifts[i].split(separator: " ").map { String($0) }
        let (a,b) = (ab[0], ab[1])
        dictArr[a]![b]! += 1
        rate[a]! += 1
        rate[b]! -= 1
    }
    
    for a in friends {
        for b in friends {
            if dictArr[a]![b]! > dictArr[b]![a]! {
                result[a]! += 1
            } else if dictArr[a]![b]! == dictArr[b]![a]! {
                if rate[a]! > rate[b]! {
                    result[a]! += 1
                }
            }
        }
    }
    
    return result.values.max()!
}

print(solution(["muzi", "ryan", "frodo", "neo"], ["muzi frodo", "muzi frodo", "ryan muzi", "ryan muzi", "ryan muzi", "frodo muzi", "frodo ryan", "neo muzi"]))
print(solution(["joy", "brad", "alessandro", "conan", "david"], ["alessandro brad", "alessandro joy", "alessandro conan", "david alessandro", "alessandro david"]))
print(solution(["a", "b", "c"], ["a b", "b a", "c a", "a c", "a c", "c a"]))
