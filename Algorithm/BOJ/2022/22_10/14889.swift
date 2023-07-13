//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/08.
//
// 14889 : 스타트와 링크
// https://www.acmicpc.net/problem/14889

import Foundation

// 입력
let n = Int(readLine()!)!
var arr = [[Int]](repeating: [], count: n)
for i in 0 ..< n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr[i] = input
}

// 풀이
var visited = [Bool](repeating: false, count: n)
var team1 = 0
var team2 = 0
var ans = Int(1e9)

func dfs(depth: Int, start: Int) {
    // 종료 조건
    if depth == n/2 {
        team1 = 0
        team2 = 0
        
        for i in 0 ..< n {
            for j in 0 ..< n {
                if visited[i], visited[j] {
                    team1 += arr[i][j]
                }
                if !visited[i], !visited[j] {
                    team2 += arr[i][j]
                }
            }
        }
        ans = min(ans, abs(team1 - team2))
        return
    }
    
    // 재귀
    for i in start ..< n {
        if !visited[i] {
            visited[i] = true
            dfs(depth: depth+1, start: i)
            visited[i] = false
        }
    }
}
dfs(depth: 0, start: 0)

// 출력
print(ans)
