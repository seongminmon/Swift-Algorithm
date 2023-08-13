//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/13.
//
// 신고 결과 받기
// 2022 KAKAO BLIND RECRUITMENT
// Lv.1
// https://school.programmers.co.kr/learn/courses/30/lessons/92334

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    let report = Array(Set(report))

    var dict = [String : Int]()
    for id in id_list {
        dict[id] = 0
    }

    for r in report {
        let temp = Array(r.split(separator: " "))
        dict[String(temp[1])]! += 1
    }

    var resultDict = [String : Int]()
    for id in id_list {
        resultDict[id] = 0
    }

    for r in report {
        let temp = Array(r.split(separator: " "))
        if dict[String(temp[1])]! >= k {
            resultDict[String(temp[0])]! += 1
        }
    }

    var result = [Int]()
    for id in id_list {
        result.append(resultDict[id]!)
    }

    return result
}

print(solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))
print(solution(["con", "ryan"], ["ryan con", "ryan con", "ryan con", "ryan con"], 3))
