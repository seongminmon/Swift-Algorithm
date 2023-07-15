//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/05/19.
//
// 10818 : 최소, 최대
// https://www.acmicpc.net/problem/10818

import Foundation

let N = Int(readLine()!)!
let inputArr = readLine()!.split(separator: " ").map{ Int($0)! }
print(inputArr.min()!, inputArr.max()!)
