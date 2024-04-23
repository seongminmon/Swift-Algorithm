//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 4/23/24.
//
// 7795 : 먹을 것인가 먹힐 것인가
// https://www.acmicpc.net/problem/7795

import Foundation

let t = Int(readLine()!)!
var ans = ""
for _ in 0..<t {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n,m) = (nm[0], nm[1])
    
    let A = readLine()!.split(separator: " ").map { Int(String($0))! }
    let B = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
    
    var cnt = 0
    for num in A {
        var start = 0
        var end = m-1
        while start <= end {
            let mid = (start + end) / 2
            
            if B[mid] < num {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        cnt += start
    }
    ans += "\(cnt)\n"
}
print(ans)
