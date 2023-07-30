//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/18.
//
// 여행경로
// 깊이/너비 우선 탐색(DFS/BFS)
// LV.3
// https://school.programmers.co.kr/learn/courses/30/lessons/43164

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    let tickets = tickets.sorted { $0[1] < $1[1] }
    var visited = [Bool](repeating: false, count: tickets.count)
    
    var result = [String]()
    func dfs(_ start: String, _ route: [String]) {
        if !result.isEmpty {
            return
        }
        
        if route.count == tickets.count + 1 {
            result = route
            return
        }
        
        for i in 0 ..< tickets.count {
            if !visited[i] && tickets[i][0] == start {
                visited[i] = true
                dfs(tickets[i][1], route + [tickets[i][1]])
                visited[i] = false
            }
        }
    }
    
    dfs("ICN", ["ICN"])
    
    return result
}

print(solution([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]))
print(solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL", "SFO"]]))
