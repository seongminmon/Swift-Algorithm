//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/22.
//
// 지형 편집
// Summer/Winter Coding(~2018)
// Lv.4
// https://school.programmers.co.kr/learn/courses/30/lessons/12984

import Foundation

func solution(_ land:[[Int]], _ p:Int, _ q:Int) -> Int64 {
    let n = land.count
    
    var totalCnt: Int64 = 0
    var arr = [Int64]()
    for i in 0..<n {
        for j in 0..<n {
            let num = Int64(land[i][j])
            arr.append(num)
            totalCnt += num
        }
    }
    arr.sort()
    
    var ans: Int64 = Int64.max
    var prevHeight: Int64 = -1
    var prevCnt: Int64 = 0
    for i in 0..<arr.count {
        // 이전 높이와 달라졌을 때만 고려
        if prevHeight < arr[i] {
            let addCnt: Int64 = arr[i] * Int64(i) - prevCnt
            let removeCnt: Int64 = totalCnt - arr[i] * Int64(arr.count - i) - prevCnt
            
            let addCost: Int64 = addCnt * Int64(p)
            let removeCost: Int64 = removeCnt * Int64(q)
            
            ans = min(ans, addCost + removeCost)
        }
        prevHeight = arr[i]
        prevCnt += arr[i]
    }
    
    return ans
}

print(solution([[1, 2], [2, 3]], 3, 2))
print(solution([[4, 4, 3], [3, 2, 2], [2, 1, 0]], 5, 3))
