//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/11/01.
//
// 17471 : 게리맨더링
// https://www.acmicpc.net/problem/17471

import Foundation

// 풀이 1
//let n = Int(readLine()!)!
//let population = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
//
//var graph = [[Int]](repeating: [], count: n+1)
//for i in 1...n {
//    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//    for j in 1..<input.count {
//        graph[i].append(input[j])
//    }
//}
//
//var ans = Int.max
//var perm = [Bool](repeating: false, count: n+1)
//func dfs(_ depth: Int, _ start: Int) {
//    var Agroup = [Int]()
//    var Bgroup = [Int]()
//    for i in 1...n {
//        if perm[i] {
//            Agroup.append(i)
//        } else {
//            Bgroup.append(i)
//        }
//    }
//    
//    // 갱신
//    if !Agroup.isEmpty && !Bgroup.isEmpty {
//        let Asum = bfs(Agroup)
//        let Bsum = bfs(Bgroup)
//        
//        if Asum != -1 && Bsum != -1 {
//            ans = min(ans, abs(Asum - Bsum))
//        }
//    }
//    
//    for i in start...n {
//        if !perm[i] {
//            perm[i] = true
//            dfs(depth+1, i)
//            perm[i] = false
//        }
//    }
//}
//
//func bfs(_ target: [Int]) -> Int {
//    let start = target[0]
//    var ret = population[start]
//    
//    var visited = [Bool](repeating: false, count: n+1)
//    visited[start] = true
//    var queue = [start]
//    var idx = 0
//    
//    while idx < queue.count {
//        let now = queue[idx]
//        idx += 1
//        
//        for next in graph[now] {
//            if !visited[next] && perm[next] == perm[now] {
//                visited[next] = true
//                queue.append(next)
//                ret += population[next]
//            }
//        }
//    }
//    
//    if queue.count == target.count {
//        return ret
//    } else {
//        return -1
//    }
//}
//
//dfs(0, 1)
//
//print(ans == Int.max ? -1 : ans)

// 풀이 2
let n = Int(readLine()!)!
let population = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }

var graph = [[Int]](repeating: [], count: n+1)
for i in 1...n {
    var input = readLine()!.split(separator: " ").map { Int(String($0))! }
    input.removeFirst()
    graph[i] = input
}

var ans = Int.max
for bitmask in 1..<(1 << n) - 1 {
    var combi = [Int](repeating: 0, count: n+1)
    var aStart = -1
    var bStart = -1
    for i in 0..<n {
        if bitmask & (1 << i) != 0 {
            combi[i+1] = 1
            aStart = i+1
        } else {
            bStart = i+1
        }
    }
    
    func bfs(_ start: Int, _ isA: Int) -> (Int,Int) {
        var sum = population[start]
        var visited = [Bool](repeating: false, count: n+1)
        visited[start] = true
        var queue = [start]
        var idx = 0
        
        while idx < queue.count {
            let now = queue[idx]
            idx += 1
            
            for next in graph[now] {
                if !visited[next] && combi[next] == isA {
                    visited[next] = true
                    queue.append(next)
                    sum += population[next]
                }
            }
        }
        
        return (queue.count, sum)
    }
    
    let (aCnt, aSum) = bfs(aStart, 1)
    let (bCnt, bSum) = bfs(bStart, 0)
    if aCnt + bCnt == n {
        ans = min(ans, abs(aSum - bSum))
    }
}

print(ans == Int.max ? -1 : ans)

