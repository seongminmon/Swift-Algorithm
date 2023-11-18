//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 11/15/23.
//
// 2923 : 숫자 게임
// https://www.acmicpc.net/problem/2923

import Foundation

let n = Int(readLine()!)!

var ans = ""
var a = [Int](repeating: 0, count: 101)
var b = [Int](repeating: 0, count: 101)
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    a[input[0]] += 1
    b[input[1]] += 1
    
    var a = a
    var b = b
    
    var Max = 0
    var i = 1
    var j = 100
    while true {
        while i <= 100 && a[i] == 0 {
            i += 1
        }
        while j >= 1 && b[j] == 0 {
            j -= 1
        }
        
        // 종료 조건
        if i > 100 || j < 1 { break }
        
        Max = max(Max, i + j)
        
        let minCnt = min(a[i], b[j])
        a[i] -= minCnt
        b[j] -= minCnt
    }
    ans += "\(Max)\n"
}
print(ans)
