//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/11.
//
// 16953 : A → B
// https://www.acmicpc.net/problem/16953

import Foundation

let ab = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (a,b) = (ab[0], ab[1])

func bfs(_ a: Int) -> Int {
    var queue = [(a,1)]
    var idx = 0
    
    while idx < queue.count {
        let (now, dist) = queue[idx]
        idx += 1
        
        if now == b { return dist }
        
        let next1 = Int(String(now) + "1")!
        if next1 <= b {
            queue.append((next1, dist+1))
        }
        
        let next2 = now*2
        if next2 <= b {
            queue.append((next2, dist+1))
        }
    }
    
    return -1
}

print(bfs(a))
