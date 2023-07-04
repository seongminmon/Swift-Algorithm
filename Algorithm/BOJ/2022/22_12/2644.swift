//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/20.
//
// 2644 : 촌수계산
// https://www.acmicpc.net/problem/2644

import Foundation

// 입력
let n = Int(readLine()!)!
let xy = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (x,y) = (xy[0], xy[1])

let m = Int(readLine()!)!
var graph = [[Int]](repeating: [], count: n+1)
for _ in 0 ..< m {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

// 풀이
let MAX = Int(1e9)
var visited = [Bool](repeating: false, count: n+1)
var result = [Int](repeating: MAX, count: n+1)
result[x] = 0

func dfs(_ a: Int) {
    if !visited[a] {
        visited[a] = true
        for i in graph[a] {
            result[i] = min(result[i], result[a] + 1)
            dfs(i)
        }
    }
}
dfs(x)

// 출력
print(result[y] != MAX ? result[y] : -1)
