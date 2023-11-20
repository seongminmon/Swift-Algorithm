//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 11/18/23.
//
// 5430 : AC
// https://www.acmicpc.net/problem/5430

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let orders = readLine()!.map { String($0) }
    _ = Int(readLine()!)!
    var input = readLine()!
    // 대괄호 삭제
    input.removeFirst()
    input.removeLast()
    // 쉼표 삭제
    var arr = input.split(separator: ",").map { Int(String($0))! }
    
    var dCnt = 0
    for i in 0..<orders.count {
        if orders[i] == "D" {
            dCnt += 1
        }
    }
    
    if dCnt > arr.count {
        print("error")
        continue
    }
    
    var s = 0
    var isReversed = false
    for order in orders {
        if order == "R" {
            // 뒤집기
            isReversed.toggle()
        } else {
            // 맨 앞 삭제
            if isReversed {
                arr.removeLast()
            } else {
                s += 1
            }
        }
    }
    
    var ans = "["
    let result = isReversed ? Array(arr[s...].reversed()) : Array(arr[s...])
    if !result.isEmpty {
        for i in 0..<result.count {
            ans += "\(result[i]),"
        }
        ans.removeLast()
    }
    ans += "]"
    
    print(ans)
}
