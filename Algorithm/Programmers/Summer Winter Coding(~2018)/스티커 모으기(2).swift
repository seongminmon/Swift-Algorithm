//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/21.
//
// 스티커 모으기(2)
// Summer/Winter Coding(~2018)
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/12971

import Foundation

func solution(_ sticker:[Int]) -> Int{
    let n = sticker.count
    
    if n <= 2 { return sticker.max()! }
    
    // 0번을 선택한 경우
    var dp1 = [Int](repeating: 0, count: n)
    dp1[0] = sticker[0]
    dp1[1] = sticker[0]
    
    for i in 2..<n-1 {
        dp1[i] = max(dp1[i-1], dp1[i-2] + sticker[i])
    }
    
    // 0번을 선택하지 않은 경우
    var dp2 = [Int](repeating: 0, count: n)
    dp2[0] = 0
    dp2[1] = sticker[1]
    
    for i in 2..<n {
        dp2[i] = max(dp2[i-1], dp2[i-2] + sticker[i])
    }
    
    return max(dp1[n-2], dp2[n-1])
}

print(solution([14, 6, 5, 11, 3, 9, 2, 10]))
print(solution([1, 3, 2, 5, 4]))
