//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/02.
//
// 11660 : 구간 합 구하기 5
// https://www.acmicpc.net/problem/11660

import Foundation

let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1)
for i in 0 ..< n {
    for j in 0 ..< n {
        dp[i+1][j+1] = dp[i+1][j] + dp[i][j+1] - dp[i][j] + graph[i][j]
    }
}

var result = ""
for _ in 0 ..< m {
    let xy = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (x1,y1,x2,y2) = (xy[0], xy[1], xy[2], xy[3])
    
    let temp = dp[x2][y2] - dp[x1-1][y2] - dp[x2][y1-1] + dp[x1-1][y1-1]
    result += "\(temp)\n"
}
print(result)
