//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/22.
//
// 후보키
// 2019 KAKAO BLIND RECRUITMENT
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/42890

import Foundation

func solution(_ relation:[[String]]) -> Int {
    let n = relation.count
    let m = relation[0].count
    var result = [Set<Int>]()
    
    func isUnique(_ temp: [Int]) -> Bool {
        var arr = [String]()
        for tuple in relation {
            var key = ""
            for i in temp { key += tuple[i] }
            arr.append(key)
        }
        return Set(arr).count == n
    }
    
    var visited = [Bool](repeating: false, count: m)
    func dfs(_ depth: Int, _ start: Int, _ temp: [Int], _ cnt: Int) {
        if depth == cnt {
            if !isUnique(temp) { return }
            for key in result {
                if key.isSubset(of: temp) {
                    return
                }
            }
            result.append(Set(temp))
            return
        }
        
        for i in start..<m {
            if !visited[i] {
                visited[i] = true
                dfs(depth+1, i, temp + [i], cnt)
                visited[i] = false
            }
        }
    }
    
    for cnt in 1...m {
        dfs(0, 0, [], cnt)
    }
    
    return result.count
}

print(solution([["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]]))
