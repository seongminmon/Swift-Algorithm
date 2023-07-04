//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/05.
//
// 1037 : 약수
// https://www.acmicpc.net/problem/1037

import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
print(arr.max()! * arr.min()!)
