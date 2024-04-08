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
    var coin = coin
    
    var idx = n / 3
    var myCard = Set<Int>(cards[0..<idx])
    var extraCard = Set<Int>()
    
    var ans = 1
    while idx+1 < n {
        // 1. 카드 2장 뽑기
        extraCard.insert(cards[idx])
        extraCard.insert(cards[idx+1])
        idx += 2
        
        // 2. 카드 2장 반납하기
        var flag = false
        
        // (1) 동전 0개 소모
        // myCard에서 2장 내기
        for a in myCard {
            let b = n + 1 - a
            if myCard.contains(b) {
                myCard.remove(a)
                myCard.remove(b)
                flag = true
                break
            }
        }
        
        if flag { ans += 1; continue }
        
        // (2) 동전 1개 소모
        // 한장씩 내기
        if coin >= 1 {
            for a in myCard {
                let b = n + 1 - a
                if extraCard.contains(b) {
                    myCard.remove(a)
                    extraCard.remove(b)
                    coin -= 1
                    flag = true
                    break
                }
            }
        }
        
        
        if flag { ans += 1; continue }
        
        // (3) 동전 2개 소모
        // extraCard에서 2장 내기
        if coin >= 2 {
            for a in extraCard {
                let b = n + 1 - a
                if extraCard.contains(b) {
                    extraCard.remove(a)
                    extraCard.remove(b)
                    coin -= 2
                    flag = true
                    break
                }
            }
        }
        
        if flag {
            ans += 1
        } else {
            break
        }
    }
    
    return ans
}

print(solution(4, [3, 6, 7, 2, 1, 10, 5, 9, 8, 12, 11, 4]))
print(solution(3, [1, 2, 3, 4, 5, 8, 6, 7, 9, 10, 11, 12]))
print(solution(2, [5, 8, 1, 2, 9, 4, 12, 11, 3, 10, 6, 7]))
print(solution(10, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]))
