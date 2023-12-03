//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 12/3/23.
//
// 2870 : 수학숙제
// https://www.acmicpc.net/problem/2870

import Foundation

let n = Int(readLine()!)!
var result = [String]()
for _ in 0..<n {
    let str = readLine()!.map { String($0) }
    
    var temp = ""
    for i in 0..<str.count {
        if Character(str[i]).isNumber {
            temp += str[i]
        } else {
            if temp != "" {
                while temp.count > 1 && temp.first! == "0" {
                    temp.removeFirst()
                }
                result.append(temp)
            }
            temp = ""
        }
    }
    
    if temp != "" {
        while temp.count > 1 && temp.first! == "0" {
            temp.removeFirst()
        }
        result.append(temp)
    }
}

result.sort {
    if $0.count == $1.count {
        let str1 = $0.map { String($0) }
        let str2 = $1.map { String($0) }
        for i in 0..<str1.count {
            if str1[i] != str2[i] {
                return str1[i] < str2[i]
            }
        }
    }
    return $0.count < $1.count
}

print(result.joined(separator: "\n"))
