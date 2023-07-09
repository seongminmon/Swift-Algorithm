//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/08.
//
// 시험장 나누기
// 2021 카카오 채용연계형 인턴십
// Lv. 5
// https://school.programmers.co.kr/learn/courses/30/lessons/81305

import Foundation

func solution(_ k:Int, _ num:[Int], _ links:[[Int]]) -> Int {
    var isRoot = [Bool](repeating: true, count: num.count)
    for link in links {
        let (l,r) = (link[0], link[1])
        if l != -1 { isRoot[l] = false }
        if r != -1 { isRoot[r] = false }
    }
    let root = isRoot.firstIndex(of: true)!
    
    var cnt = 0
    var limit = 0
    func dfs(_ now: Int) -> Int {
        let left = links[now][0] == -1 ? 0 : dfs(links[now][0])
        let right = links[now][1] == -1 ? 0 : dfs(links[now][1])
        
        let totalSum = num[now] + left + right
        if totalSum <= limit {
            return totalSum
        }
        
        let twoSum = num[now] + min(left, right)
        if twoSum <= limit {
            cnt += 1
            return twoSum
        }
        
        cnt += 2
        return num[now]
    }
    
    func check(_ mid: Int) -> Bool {
        cnt = 0
        limit = mid
        dfs(root)
        return cnt < k
    }
    
    var start = num.max()!
    var end = num.reduce(0, +)
    while start <= end {
        let mid = (start + end) / 2
        if check(mid) {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return start
}

print(solution(3, [12, 30, 1, 8, 8, 6, 20, 7, 5, 10, 4, 1], [[-1, -1], [-1, -1], [-1, -1], [-1, -1], [8, 5], [2, 10], [3, 0], [6, 1], [11, -1], [7, 4], [-1, -1], [-1, -1]]))
print(solution(1, [6, 9, 7, 5], [[-1, -1], [-1, -1], [-1, 0], [2, 1]]))
print(solution(2, [6, 9, 7, 5], [[-1, -1], [-1, -1], [-1, 0], [2, 1]]))
print(solution(4, [6, 9, 7, 5], [[-1, -1], [-1, -1], [-1, 0], [2, 1]]))
