//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/06.
//
// 순위 검색
// 2021 KAKAO BLIND RECRUITMENT
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/72412

import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var dict = [String: [Int]]()
    
    for i in 0..<info.count {
        let str = info[i].split(separator: " ")
        let score = Int(str[4])!
        
        var visited = [Bool](repeating: false, count: 4)
        func dfs(_ depth: Int, _ start: Int, _ temp: String) {
            if depth == 4 {
                dict[temp, default: []].append(score)
                return
            }
            
            for i in start..<4 {
                if !visited[i] {
                    visited[i] = true
                    dfs(depth+1, i, temp + str[i])
                    dfs(depth+1, i, temp + "-")
                    visited[i] = false
                }
            }
        }
        dfs(0, 0, "")
    }
    
    for key in dict.keys {
        dict[key]!.sort()
    }
    
    func binarySearch(_ arr: [Int], _ target: Int) -> Int {
        var start = 0
        var end = arr.count-1
        while start <= end {
            let mid = (start + end) / 2
            if arr[mid] < target {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        return arr.count - start
    }
    
    var result = [Int]()
    for i in 0..<query.count {
        let str = query[i].replacingOccurrences(of: "and", with: "").split(separator: " ")
        let score = Int(str[4])!
        
        if let arr = dict[str[0...3].joined()] {
            result.append(binarySearch(arr, score))
        } else {
            result.append(0)
        }
    }
    return result
}

print(solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]))
