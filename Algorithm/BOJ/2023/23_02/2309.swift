//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/02/14.
//
// 2309 : 일곱 난쟁이
// https://www.acmicpc.net/problem/2309

import Foundation

var heights = [Int]()
for _ in 0 ..< 9 {
    heights.append(Int(readLine()!)!)
}

// 1. 보통 풀이
let diff = heights.reduce(0,+) - 100
outerLoop: for i in 0 ..< 9 {
    for j in i+1 ..< 9 {
        if heights[i] + heights[j] == diff {
            heights.remove(at: i)
            heights.remove(at: j-1)
            break outerLoop
        }
    }
}

for i in heights.sorted() { print(i) }

// 2. 내 풀이
//heights.sort()
//
//var result = [Int]()
//var visited = [Bool](repeating: false, count: 9)
//func dfs(_ depth: Int, _ start: Int, _ sum: Int) {
//    if !result.isEmpty { return }
//
//    if depth == 7 {
//        if sum == 100 {
//            for i in 0 ..< 9 {
//                if visited[i] {
//                    result.append(heights[i])
//                }
//            }
//        }
//        return
//    }
//
//    for i in start ..< 9 {
//        if !visited[i] {
//            visited[i] = true
//            dfs(depth+1, i, sum + heights[i])
//            visited[i] = false
//        }
//    }
//}
//
//dfs(0, 0, 0)
//
//for i in result { print(i) }
