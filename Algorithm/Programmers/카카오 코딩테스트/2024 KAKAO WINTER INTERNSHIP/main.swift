//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 3/23/24.
//
// n + 1 카드게임
// 2024 KAKAO WINTER INTERNSHIP
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/258707

import Foundation

func solution(_ coin:Int, _ cards:[Int]) -> Int {
    let n = cards.count
    
    // 1. n/3장 모두 갖기
    var dict = [Int: Int]()
    var setCount = 0
    var idx = 0
    while idx < n/3 {
        let num = cards[idx]
        if dict[n+1-num] != nil {
            dict[n+1-num] = nil
            setCount += 1
        } else {
            dict[num] = 0
        }
        idx += 1
    }
    
    var ans = 1
    func dfs(_ idx: Int, _ dict: [Int: Int], _ setCount: Int, _ coin: Int, _ round: Int) {
        // 갱신
        ans = max(ans, round)
        // 종료 조건1: 뽑을 카드 뭉치 없을 때
        if idx == n {
            return
        }
        
        let num1 = cards[idx]
        let num2 = cards[idx+1]
        
        var nextDict = dict
        var nextSetCount = setCount
        
        // 종료 조건2: 2장 제출 실패
        // 1. 선택 x
        if setCount > 0 {
            dfs(idx+2, dict, setCount-1, coin, round+1)
        }
        
        if coin > 0 {
            // 2. 첫번째 선택
            if nextDict[n+1-num1] != nil {
                nextDict[n+1-num1] = nil
                nextSetCount += 1
            } else {
                nextDict[num1] = 0
            }
            
            if nextSetCount > 0 {
                dfs(idx+2, nextDict, nextSetCount-1, coin-1, round+1)
            }
            
            // 원상복구
            nextDict = dict
            nextSetCount = setCount
            
            // 3. 두번째 선택
            if nextDict[n+1-num2] != nil {
                nextDict[n+1-num2] = nil
                nextSetCount += 1
            } else {
                nextDict[num2] = 0
            }
            
            if nextSetCount > 0 {
                dfs(idx+2, nextDict, nextSetCount-1, coin-1, round+1)
            }
        }
        
        // 4. 모두 선택
        if coin > 1 {
            if nextDict[n+1-num1] != nil {
                nextDict[n+1-num1] = nil
                nextSetCount += 1
            } else {
                nextDict[num1] = 0
            }
            if nextSetCount > 0 {
                dfs(idx+2, nextDict, nextSetCount-1, coin-2, round+1)
            }
        }
    }
    
    dfs(idx, dict, setCount, coin, 1)
    
    return ans
}

print(solution(4, [3, 6, 7, 2, 1, 10, 5, 9, 8, 12, 11, 4]))
print(solution(3, [1, 2, 3, 4, 5, 8, 6, 7, 9, 10, 11, 12]))
print(solution(2, [5, 8, 1, 2, 9, 4, 12, 11, 3, 10, 6, 7]))
print(solution(10, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]))
