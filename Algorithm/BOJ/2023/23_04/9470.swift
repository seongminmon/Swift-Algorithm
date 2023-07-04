//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/03.
//
// 9470 : Strahler 순서
// https://www.acmicpc.net/problem/9470

import Foundation

let t = Int(readLine()!)!
for _ in 0 ..< t {
    let kmp = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (k,m,p) = (kmp[0], kmp[1], kmp[2])
    
    var graph = [[Int]](repeating: [], count: m+1)
    var inDegree = [Int](repeating: 0, count: m+1)
    for _ in 0 ..< p {
        let ab = readLine()!.split(separator: " ").map{ Int(String($0))! }
        let (a,b) = (ab[0], ab[1])
        graph[a].append(b)
        inDegree[b] += 1
    }
    
    var strahler = [Int](repeating: 0, count: m+1)
    var cntList = [Int](repeating: 0, count: m+1)
    var queue = [Int]()
    for i in 1 ... m {
        if inDegree[i] == 0 {
            strahler[i] = 1
            queue.append(i)
        }
    }

    var idx = 0
    while idx < queue.count {
        let now = queue[idx]
        idx += 1
        
        for next in graph[now] {
            if strahler[next] < strahler[now] {
                strahler[next] = strahler[now]
                cntList[next] = 1
            } else if strahler[next] == strahler[now] {
                cntList[next] += 1
            }
            
            inDegree[next] -= 1
            if inDegree[next] == 0 {
                queue.append(next)
                if cntList[next] >= 2 {
                    strahler[next] += 1
                }
            }
        }
    }
    
    print(k, strahler[m])
}
