//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/20.
//
// 9205 : 맥주 마시면서 걸어가기
// https://www.acmicpc.net/problem/9205

import Foundation

let t = Int(readLine()!)!
for _ in 0 ..< t {
    // 입력
    let n = Int(readLine()!)!
    var location = [(Int,Int)]()
    for _ in 0 ..< n+2 {
        let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
        location.append((input[0], input[1]))
    }
    
    // 풀이
    var distance = [Int](repeating: 0, count: location.count)
    
    var visited = [Bool](repeating: false, count: location.count)
    var queue = [(Int,Int)]()
    var idx = 0
    
    queue.append(location[0])
    visited[0] = true
    
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        // 종료 조건
        if (x,y) == location.last! {
            break
        }
        
        for i in 0 ..< location.count {
            if !visited[i] {
                let (nx, ny) = location[i]
                let dist = abs(x - nx) + abs(y - ny)
                
                if dist <= 1000 {
                    visited[i] = true
                    queue.append((nx, ny))
                    distance[i] = dist
                }
            }
        }
    }
    
    // 출력
    print(distance.last! != 0 ? "happy" : "sad")
}
