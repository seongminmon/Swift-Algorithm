//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 1/1/24.
//
// 14405 : 피카츄
// https://www.acmicpc.net/problem/14405

import Foundation

// 풀이 1
//let str = readLine()!.map { String($0) }
//let arr = ["pi", "ka", "chu"]
//
//var flag = true
//var idx = 0
//while idx < str.count {
//    var word = str[idx]
//    idx += 1
//    
//    // 두글자 만들기
//    if idx < str.count {
//        word += str[idx]
//    }
//    if word == arr[0] || word == arr[1] {
//        idx += 1
//        continue
//    }
//    
//    // 세글자 만들기
//    idx += 1
//    if idx < str.count {
//        word += str[idx]
//    }
//    if word == arr[2] {
//        idx += 1
//        continue
//    }
//    
//    // 불가능
//    flag = false
//    break
//}
//
//print(flag ? "YES" : "NO")

// 풀이 2
var str = readLine()!
str = str.replacingOccurrences(of: "pi", with: "-")
str = str.replacingOccurrences(of: "ka", with: "-")
str = str.replacingOccurrences(of: "chu", with: "-")
str = str.replacingOccurrences(of: "-", with: "")
print(str.isEmpty ? "YES" : "NO")
