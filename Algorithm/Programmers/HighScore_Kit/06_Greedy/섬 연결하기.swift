//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/14.
//
// 섬 연결하기
// 탐욕법(Greedy)
// LV.3
// https://school.programmers.co.kr/learn/courses/30/lessons/42861

import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    let edges = costs.sorted { $0[2] < $1[2] }
    var parents = [Int](repeating: 0, count: n)
    for i in 0..<n { parents[i] = i }
    
    func find(_ x: Int) -> Int {
        if parents[x] != x {
            parents[x] = find(parents[x])
        }
        return parents[x]
    }
    
    func union(_ x: Int, _ y: Int) {
        let x = find(x)
        let y = find(y)
        
        if x < y {
            parents[y] = x
        } else {
            parents[x] = y
        }
    }
    
    var result = 0
    for edge in edges {
        let (x, y, cost) = (edge[0], edge[1], edge[2])
        if find(x) != find(y) {
            union(x,y)
            result += cost
        }
    }
    
    return result
}

print(solution(4, [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]]))
