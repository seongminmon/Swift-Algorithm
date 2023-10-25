//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/14.
//
// 양과 늑대
// 2022 KAKAO BLIND RECRUITMENT
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/92343

import Foundation

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    var children = [[Int]](repeating: [], count: info.count)
    for edge in edges {
        children[edge[0]].append(edge[1])
    }
    
    var ans = 0
    func dfs(_ cur: Int, _ sheep: Int, _ wolf: Int, _ visit: [Int]) {
        var nextSheep = sheep
        var nextWolf = wolf
        nextSheep += info[cur] == 0 ? 1 : 0
        nextWolf += info[cur]
        
        // 탐색 불가
        if nextSheep <= nextWolf { return }
        
        // 갱신
        ans = max(ans, nextSheep)
        
        // 다음 방문할 노드들
        var nextVisit = visit
        // 자신 삭제
        let idx = nextVisit.firstIndex(of: cur)!
        nextVisit.remove(at: idx)
        // 자식 노드 추가
        nextVisit += children[cur]
        
        // 탐색
        for next in nextVisit {
            dfs(next, nextSheep, nextWolf, nextVisit)
        }
    }
    
    dfs(0, 0, 0, [0])
    
    return ans
}

print(solution([0,0,1,1,1,0,1,0,1,0,1,1], [[0,1],[1,2],[1,4],[0,8],[8,7],[9,10],[9,11],[4,3],[6,5],[4,6],[8,9]]))
print(solution([0,1,0,1,1,0,1,0,0,1,0], [[0,1],[0,2],[1,3],[1,4],[2,5],[2,6],[3,7],[4,8],[6,9],[9,10]]))
