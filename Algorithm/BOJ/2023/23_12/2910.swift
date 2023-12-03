//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 12/3/23.
//
// 2910 : 빈도 정렬
// https://www.acmicpc.net/problem/2910

import Foundation

let nc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,c) = (nc[0], nc[1])
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var countDict = [Int: Int]()
var orderDict = [Int: Int]()
var i = 0
for num in arr {
    countDict[num, default: 0] += 1
    if orderDict[num] == nil {
        orderDict[num] = i
        i += 1
    }
}

arr.sort {
    if countDict[$0]! == countDict[$1]! {
        return orderDict[$0]! < orderDict[$1]!
    } else {
        return countDict[$0]! > countDict[$1]!
    }
}

print(arr.map { String($0) }.joined(separator: " "))
