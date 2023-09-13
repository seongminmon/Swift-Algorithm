//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/09/12.
//
// 12015 : 가장 긴 증가하는 부분 수열 2
// https://www.acmicpc.net/problem/12015

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var result = [Int]()
result.append(arr[0])
for i in 1..<n {
    if result.last! < arr[i] {
        result.append(arr[i])
    } else {
        var start = 0
        var end = result.count - 1
        while start <= end {
            let mid = (start + end) / 2
            
            if result[mid] < arr[i] {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        result[start] = arr[i]
    }
}

print(result.count)
