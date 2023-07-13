//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/22.
//
// 3649 : 로봇 프로젝트
// https://www.acmicpc.net/problem/3649

import Foundation

while let input = readLine() {
    // 입력
    let x = Int(input)! * Int(1e7)
    let n = Int(readLine()!)!
    var arr = [Int]()
    for _ in 0 ..< n {
        arr.append(Int(readLine()!)!)
    }
    
    // 풀이
    arr.sort()
    
    // 투포인터
    var i = 0
    var j = n-1
    var flag = false
    while i < j {
        if arr[i] + arr[j] < x {
            i += 1
        } else if arr[i] + arr[j] > x {
            j -= 1
        } else {
            flag = true
            break
        }
    }
    
    // 출력
    if flag {
        print("yes \(arr[i]) \(arr[j])")
    } else {
        print("danger")
    }
}
