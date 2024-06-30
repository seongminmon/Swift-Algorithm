//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/10.
//
// 11053 : 가장 긴 증가하는 부분 수열
// https://www.acmicpc.net/problem/11053

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

var ans: [Int] = [arr[0]]

func binarySearch(_ target: Int) -> Int {
    var start = 0
    var end = ans.count - 1
    while start < end {
        let mid = (start + end) / 2
        
        if ans[mid] >= target {
            end = mid
        } else {
            start = mid + 1
        }
    }
    return end
}

for i in 1..<n {
    if arr[i] > ans.last! {
        ans.append(arr[i])
    } else {
        let idx = binarySearch(arr[i])
        ans[idx] = arr[i]
    }
}

print(ans.count)
