//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/22.
//
// 스킬트리
// Summer/Winter Coding(~2018)
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/49993

import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var ans = 0
    let skill = Array(skill)
    
    for i in 0..<skill_trees.count {
        let skillTree = Array(skill_trees[i])
        
        var flag = true
        var idx = 0
        for j in 0..<skillTree.count {
            let ch = skillTree[j]
            
            if skill.contains(ch) {
                if skill[idx] == ch {
                    idx += 1
                } else {
                    flag = false
                    break
                }
            }
        }
        
        if flag { ans += 1 }
    }
    
    return ans
}

print(solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"]))
