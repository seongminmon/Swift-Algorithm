//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 11/27/23.
//
// 10988 : 팰린드롬인지 확인하기
// https://www.acmicpc.net/problem/10988

import Foundation

let str = readLine()!
print(str == String(str.reversed()) ? 1 : 0)
