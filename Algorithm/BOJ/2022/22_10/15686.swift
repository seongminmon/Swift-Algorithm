//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/09.
//
// 15686 : 치킨 배달
// https://www.acmicpc.net/problem/15686

import Foundation

// 입력
let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var arr = [[Int]](repeating: [], count: n)
for i in 0 ..< n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr[i] = input
}

// 풀이
// 집, 치킨집 좌표
var house = [(Int,Int)]()
var chicken = [(Int,Int)]()
for i in 0 ..< n {
    for j in 0 ..< n {
        if arr[i][j] == 1 {
            house.append((i,j))
        }
        if arr[i][j] == 2 {
            chicken.append((i,j))
        }
    }
}

var visited = [Bool](repeating: false, count: chicken.count)
var sum = 0         // 도시의 치킨거리
var MIN = Int(1e9)  // 한 집의 치킨거리
var ans = Int(1e9)

func dfs(depth: Int, start: Int) {
    // 종료 조건
    if depth == m {
        sum = 0
        for (i,j) in house {
            MIN = Int(1e9)
            for k in 0 ..< chicken.count {
                if visited[k] {
                    MIN = min(MIN, abs(i-chicken[k].0) + abs(j-chicken[k].1))
                }
            }
            sum += MIN
        }
        ans = min(ans, sum)
        return
    }
    
    for i in start ..< chicken.count {
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
