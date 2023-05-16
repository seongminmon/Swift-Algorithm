//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/12.
//
// 11066 : 파일 합치기
// https://www.acmicpc.net/problem/11066

import Foundation

let t = Int(readLine()!)!
for _ in 0 ..< t {
    let k = Int(readLine()!)!
    let arr = [0] + readLine()!.split(separator: " ").map{ Int(String($0))! }
    var sumArr = [Int](repeating: 0, count: k+1)
    for i in 1 ... k {
        sumArr[i] = sumArr[i-1] + arr[i]
    }
    
    var dp = [[Int]](repeating: [Int](repeating: 0, count: k+1), count: k+1)
    for d in 1 ..< k {
        for start in 1 ... k-d {
            let end = start + d
            
            var temp = Int.max
            for mid in start ..< end {
                temp = min(temp, dp[start][mid] + dp[mid+1][end] + sumArr[end] - sumArr[start-1])
            }
            dp[start][end] = temp
        }
    }
    
    print(dp[1][k])
}
