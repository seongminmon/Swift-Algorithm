//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/04.
//
// 1966 : 프린터 큐
// https://www.acmicpc.net/problem/1966

import Foundation

let t = Int(readLine()!)!
for _ in 0 ..< t {
    // 입력
    let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (n,m) = (nm[0], nm[1])
    let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
    
    // 풀이
    var queue = [(Int,Int)]()
    for i in 0 ..< n {
        queue.append((arr[i], i))
    }
    
    var result = [(Int,Int)]()
    while !queue.isEmpty {
        var MAX = 0
        for i in queue {
            MAX = max(MAX, i.0)
        }
        
        if queue.first!.0 < MAX {
            let a = queue.removeFirst()
            queue.append(a)
        } else {
            let a = queue.removeFirst()
            result.append(a)
            
            // 종료 조건
            if a.1 == m {
                break
            }
        }
    }
    
    // 출력
    for i in 0 ..< result.count {
        if result[i].1 == m {
            print(i+1)
            break
        }
    }
    
}
