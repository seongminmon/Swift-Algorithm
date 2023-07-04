//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/17.
//
// 2310 : 어드벤처 게임
// https://www.acmicpc.net/problem/2310

import Foundation

while true {
    let n = Int(readLine()!)!
    if n == 0 { break }
    
    var rooms = [String](repeating: "", count: n+1)
    var prices = [Int](repeating: 0, count: n+1)
    var graph = [[Int]](repeating: [], count: n+1)
    for i in 1...n {
        let input = readLine()!.split(separator: " ").map { String($0) }
        rooms[i] = input[0]
        prices[i] = Int(input[1])!
        for j in 2..<input.count-1 {
            graph[i].append(Int(input[j])!)
        }
    }
    
    var visited = [Bool](repeating: false, count: n+1)
    func dfs(_ now: Int, _ currentMoney: Int) {
        visited[now] = true
        for next in graph[now] {
            if visited[next] { continue }
            if rooms[next] == "T" {
                if currentMoney >= prices[next] {
                    dfs(next, currentMoney - prices[next])
                }
            } else {
                dfs(next, max(currentMoney, prices[next]))
            }
        }
    }
    
    dfs(1, 0)
    print(visited[n] ? "Yes" : "No")
}
