//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/12.
//
// 매출 하락 최소화
// 2021 KAKAO BLIND RECRUITMENT
// Lv.4
// https://school.programmers.co.kr/learn/courses/30/lessons/72416

import Foundation

func solution(_ sales:[Int], _ links:[[Int]]) -> Int {
    var children = [[Int]](repeating: [], count: sales.count+1)
    for link in links {
        children[link[0]].append(link[1])
    }
    
    // 1. dp[i][0]: i번 노드가 불참했을 때 최적해
    // 자식 노드 중 하나 이상의 참석이 필요함
    
    // 2. dp[i][1]: i번 노드가 참석했을 때 최적해
    // 자식 노드의 참석이 필요 없음
    
    // 리프 노드의 경우
    // dp[i][0] = 0
    // dp[i][1] = 자신의 비용
    
    // 리프노드가 아닌 경우
    // dp[i][1] = 자신의 비용 +
    // 모든 자식 노드 k에 대하여
    // min(dp[k][0], dp[k][1])의 합
    
    // dp[i][0] = 0 +
    // (1) 하나의 k라도 참석하는 경우
    // dp[i][1]과 마찬가지로
    // 모든 자식 노드 k에 대하여
    // min(dp[k][0], dp[k][1])의 합
    
    // (2) 모든 자식노드 k가 불참하는 경우
    // 자식 중 손해 비용이 최소가 되는 경우를 참석시켜야 함
    // 0 +
    // min(dp[k][0], dp[k][1])의 합 +
    // 모든 자식노드 k에 대하여
    // dp[k][1] - dp[k][0]의 최솟값
    
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: sales.count+1)
    func dfs(_ node: Int) {
        dp[node][0] = 0
        dp[node][1] = sales[node-1]
        
        if children[node].isEmpty { return }
        
        var minDiff = Int.max
        for child in children[node] {
            dfs(child)
            
            if dp[child][0] < dp[child][1] {
                dp[node][0] += dp[child][0]
                dp[node][1] += dp[child][0]
                
                minDiff = min(minDiff, dp[child][1] - dp[child][0])
            } else {
                dp[node][0] += dp[child][1]
                dp[node][1] += dp[child][1]
                
                // 자식 노드 중 하나라도 참여한 경우
                minDiff = 0
            }
        }
        
        dp[node][0] += minDiff
    }
    dfs(1)
    
    return min(dp[1][0], dp[1][1])
}

print(solution([14, 17, 15, 18, 19, 14, 13, 16, 28, 17], [[10, 8], [1, 9], [9, 7], [5, 4], [1, 5], [5, 10], [10, 6], [1, 3], [10, 2]]))
print(solution([5, 6, 5, 3, 4], [[2,3], [1,4], [2,5], [1,2]]))
print(solution([5, 6, 5, 1, 4], [[2,3], [1,4], [2,5], [1,2]]))
print(solution([10, 10, 1, 1], [[3,2], [4,3], [1,4]]))
