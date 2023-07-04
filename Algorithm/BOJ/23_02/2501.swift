//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/02/14.
//
// 2501 : 약수 구하기
// https://www.acmicpc.net/problem/2501

import Foundation

let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,k) = (nk[0], nk[1])

var arr = [Int]()
for i in 1 ... n {
    if n % i == 0 {
        arr.append(i)
    }
}

var result = 0
if k-1 < arr.count {
    result = arr[k-1]
}
print(result)
