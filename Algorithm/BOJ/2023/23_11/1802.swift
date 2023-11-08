//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/11/08.
//
// 1802 : 종이 접기
// https://www.acmicpc.net/problem/1802

import Foundation

var ans = ""
let t = Int(readLine()!)!
for _ in 0..<t {
    let arr = readLine()!.map { Int(String($0))! }
    
    func check(_ start: Int, _ end: Int) -> Bool {
        if start == end { return true }
        
        let mid = (start + end) / 2
        for i in start..<mid {
            if arr[i] == arr[end - i] {
                return false
            }
        }
        
        return check(start, mid-1) && check(mid+1, end)
    }
    
    ans += check(0, arr.count-1) ? "YES\n" : "NO\n"
}

print(ans)
