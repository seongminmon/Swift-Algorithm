//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/25.
//
// 1016 : 제곱 ㄴㄴ 수
// https://www.acmicpc.net/problem/1016

import Foundation

let input = readLine()!.split(separator: " ").map { Int64(String($0))! }
let (Min, Max) = (input[0], input[1])

let SIZE = Int(Max-Min+1)
var arr = [Bool](repeating: true, count: SIZE)

var i: Int64 = 2
while i * i <= Max {
    let pow = i * i
    
    var j = ((Min-1) / pow + 1) * pow
    while j <= Max {
        arr[Int(j - Min)] = false
        j += pow
    }
    
    i += 1
}

print(arr.filter { $0 }.count)
