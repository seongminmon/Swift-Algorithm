//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/28.
//
// 1516 : 게임 개발
// https://www.acmicpc.net/problem/1516

import Foundation

let n = Int(readLine()!)!

var times = [Int](repeating: 0, count: n+1)
var graph = [[Int]](repeating: [], count: n+1)
var indegree = [Int](repeating: 0, count: n+1)
for i in 1...n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    times[i] = input[0]
    
    for j in 1..<input.count-1 {
        graph[input[j]].append(i)
        indegree[i] += 1
    }
}

// 위상정렬
var dp = [Int](repeating: 0, count: n+1)
var queue = [Int]()
for i in 1...n {
    if indegree[i] == 0 {
        dp[i] = times[i]
        queue.append(i)
    }
}

while !queue.isEmpty {
    let now = queue.removeFirst()
    
    for next in graph[now] {
        indegree[next] -= 1
        if indegree[next] == 0 {
            queue.append(next)
        }
        
        dp[next] = max(dp[next], dp[now] + times[next])
    }
}

var ans = ""
for i in 1...n {
    ans += "\(dp[i])\n"
}
print(ans)
