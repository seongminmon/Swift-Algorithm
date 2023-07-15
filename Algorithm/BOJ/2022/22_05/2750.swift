//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/05/23.
//
// 2750 : 수 정렬하기
// https://www.acmicpc.net/problem/2750

import Foundation

let n = Int(readLine()!)!
var myArr = [Int]()
for _ in 0..<n {
    myArr.append(Int(readLine()!)!)
}

func mySort(arr:inout [Int])->[Int] {
    for i in 0..<n {
        for j in i+1..<n {
            if arr[i]>arr[j] {
                let temp = arr[i]
                arr[i] = arr[j]
                arr[j] = temp
            }
        }
    }
    return arr
}

let ans = mySort(arr: &myArr)
for i in 0..<n {
    print(ans[i])
}

