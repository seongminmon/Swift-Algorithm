//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/11/11.
//
// 4716 : 풍선
// https://www.acmicpc.net/problem/4716

import Foundation

while true {
    let nab = readLine()!.split(separator: " ").map { Int(String($0))! }
    var (n,a,b) = (nab[0], nab[1], nab[2])
    
    // 종료 조건
    if (n,a,b) == (0,0,0) { break }
    
    var arr = [(Int,Int,Int)]()
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        arr.append((input[0], input[1], input[2]))
    }
    
    arr.sort { abs($0.1 - $0.2) > abs($1.1 - $1.2) }
    
    var ans = 0
    for (k, aDist, bDist) in arr {
        var cnt = 0
        if aDist <= bDist {
            cnt = min(k, a)
        } else {
            cnt = k - min(k, b)
        }
        
        ans += aDist * cnt + bDist * (k - cnt)
        
        a -= cnt
        b -= k - cnt
    }
    
    print(ans)
}
