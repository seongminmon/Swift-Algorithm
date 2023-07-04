//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/24.
//
// 9082 : 지뢰찾기
// https://www.acmicpc.net/problem/9082

import Foundation

let t = Int(readLine()!)!
for _ in 0 ..< t {
    let n = Int(readLine()!)!
    var arr = readLine()!.map{ Int(String($0))! }
    let mine = readLine()!
    
    var result = 0
    for i in 0 ..< n {
        if i == 0 {
            if arr[i] != 0, arr[i+1] != 0 {
                arr[i] -= 1
                arr[i+1] -= 1
                result += 1
            }
        } else if i == n-1 {
            if arr[i-1] != 0, arr[i] != 0 {
                arr[i-1] -= 1
                arr[i] -= 1
                result += 1
            }
        } else {
            if arr[i-1] != 0, arr[i] != 0, arr[i+1] != 0 {
                arr[i-1] -= 1
                arr[i] -= 1
                arr[i+1] -= 1
                result += 1
            }
        }
    }
    
    print(result)
}
