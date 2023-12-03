//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 12/3/23.
//
// 4659 : 비밀번호 발음하기
// https://www.acmicpc.net/problem/4659

import Foundation

while let input = readLine() {
    if input == "end" { break }
    
    func isAcceptable(_ str: String) -> Bool {
        let str = str.map { String($0) }
        
        // 1. 모음(a,e,i,o,u) 하나를 반드시 포함하여야 한다.
        let vowel = ["a", "e", "i", "o", "u"]
        var flag = false
        for v in vowel {
            if str.contains(v) {
                flag = true
            }
        }
        if !flag { return false }
        
        // 2. 모음이 3개 혹은 자음이 3개 연속으로 오면 안 된다.
        var vowelCnt = 0
        var consonantCnt = 0
        for i in 0..<str.count {
            let s = str[i]
            if vowel.contains(s) {
                consonantCnt = 0
                vowelCnt += 1
            } else {
                vowelCnt = 0
                consonantCnt += 1
            }
            
            if vowelCnt == 3 || consonantCnt == 3 {
                return false
            }
        }
        
        // 3. 같은 글자가 연속적으로 두번 오면 안되나, ee 와 oo는 허용한다.
        for i in 1..<str.count {
            let s = str[i]
            if s == str[i-1] && str[i-1] + s != "ee" && str[i-1] + s != "oo" {
                return false
            }
        }
        
        return true
    }
    
    if isAcceptable(input) {
        print("<\(input)> is acceptable.")
    } else {
        print("<\(input)> is not acceptable.")
    }
}
