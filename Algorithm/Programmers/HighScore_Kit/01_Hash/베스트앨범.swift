//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/30.
//
// 베스트앨범
// 해시
// LV.3
// https://school.programmers.co.kr/learn/courses/30/lessons/42579

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var dict1 = [String: Int]()
    var dict2 = [String: [(Int,Int)]]()
    for i in 0..<genres.count {
        if dict1[genres[i]] == nil {
            dict1[genres[i]] = plays[i]
        } else {
            dict1[genres[i]]! += plays[i]
        }
        
        if dict2[genres[i]] == nil {
            dict2[genres[i]] = [(i, plays[i])]
        } else {
            dict2[genres[i]]!.append((i, plays[i]))
        }
    }
    
    var result = [Int]()
    let sortedKey = dict1.sorted { $0.value > $1.value }.map { $0.key }
    for key in sortedKey {
        let musics = dict2[key]!.sorted {
            if $0.1 == $1.1 {
                return $0.0 < $1.0
            } else {
                return $0.1 > $1.1
            }
        }
        
        if musics.count == 1 {
            result.append(musics[0].0)
        } else {
            for i in 0..<2 {
                result.append(musics[i].0)
            }
        }
    }
    
    return result
}

print(solution(
    ["classic", "pop", "classic", "classic", "pop"],
    [500, 600, 150, 800, 2500]
))
