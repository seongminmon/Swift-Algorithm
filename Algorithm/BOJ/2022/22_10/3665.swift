//
//  3665.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/15.
//
// 3665 : 최종 순위
// https://www.acmicpc.net/problem/3665

import Foundation

let t = Int(readLine()!)!
for _ in 0 ..< t {
    // 입력
    let n = Int(readLine()!)!
    let data = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    // 풀이
    var graph = [[Bool]](repeating: [Bool](repeating: false, count: n+1), count: n+1)
    var indegree = [Int](repeating: 0, count: n+1)
    for i in 0 ..< n {
        for j in i+1 ..< n {
            graph[data[i]][data[j]] = true
            indegree[data[j]] += 1
        }
    }
    
    let m = Int(readLine()!)!
    for _ in 0 ..< m {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (a,b) = (input[0], input[1])
        
        // 간선 방향 뒤집기
        if graph[a][b] {
            graph[a][b] = false
            graph[b][a] = true
            indegree[a] += 1
            indegree[b] -= 1
        } else {
            graph[a][b] = true
            graph[b][a] = false
            indegree[a] -= 1
            indegree[b] += 1
        }
    }
    
    // 위상 정렬
    var result = [Int]()
    var queue = [Int]()
    for i in 1 ... n {
        if indegree[i] == 0 {
            queue.append(i)
        }
    }
    
    var cycle = false
    var certain = false
    for _ in 0 ..< n {
        // 사이클 발생
        if queue.isEmpty {
            cycle = true
            break
        }
        
        // 결과 여러개
        if queue.count > 1 {
            certain = true
            break
        }
        
        let now = queue.removeFirst()
        result.append(now)
        
        for j in 1 ... n {
            if graph[now][j] {
                indegree[j] -= 1
                if indegree[j] == 0 {
                    queue.append(j)
                }
            }
        }
    }
    
    // 출력
    if cycle {
        print("IMPOSSIBLE")
    } else if certain {
        print("?")
    } else {
        for i in result {
            print(i, terminator: " ")
        }
        print("")
    }
}
