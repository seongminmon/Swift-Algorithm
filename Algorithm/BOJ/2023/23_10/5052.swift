//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/08.
//
// 5052 : 전화번호 목록
// https://www.acmicpc.net/problem/5052

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    var arr = [String]()
    for _ in 0..<n {
        let input = readLine()!
        arr.append(input)
    }
    
    arr.sort()
    
    var flag = true
    for i in 1..<n {
        if arr[i].hasPrefix(arr[i-1]) {
            flag = false
            break
        }
    }
    print(flag ? "YES" : "NO")
}
