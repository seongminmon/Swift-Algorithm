//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/05/23.
//
// 10870 : 피보나치 수5
// https://www.acmicpc.net/problem/10870

import Foundation

let n = Int(readLine()!)!
var ans: Int

func fibo(x:Int)->Int {
    if x==0 {
        return 0
    } else if x==1 {
        return 1
    } else {
        return fibo(x: x-1) + fibo(x: x-2)
    }
}

ans = fibo(x: n)
print(ans)
