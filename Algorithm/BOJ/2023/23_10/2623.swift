//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/31.
//
// 2623 : 음악프로그램
// https://www.acmicpc.net/problem/2623

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var graph = [[Int]](repeating: [], count: n+1)
var indegree = [Int](repeating: 0, count: n+1)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in 1..<input.count-1 {
        graph[input[j]].append(input[j+1])
        indegree[input[j+1]] += 1
    }
}

var queue = [Int]()
for i in 1...n {
    if indegree[i] == 0 {
        queue.append(i)
    }
}

var result = [Int]()
while !queue.isEmpty {
    let now = queue.removeLast()
    result.append(now)
    
    for next in graph[now] {
        indegree[next] -= 1
        if indegree[next] == 0 {
            queue.append(next)
        }
    }
}

if result.count == n {
    var ans = ""
    for i in result { ans += "\(i)\n"}
    print(ans)
} else {
    print(0)
}
