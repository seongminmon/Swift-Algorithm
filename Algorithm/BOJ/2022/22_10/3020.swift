//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/20.
//
// 3020 : 개똥벌레
// https://www.acmicpc.net/problem/3020

import Foundation

// 입력
let nh = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,h) = (nh[0], nh[1])

var hurdle1 = [Int]()
var hurdle2 = [Int]()
for _ in stride(from: 0, to: n, by: 2) {
    hurdle1.append(Int(readLine()!)!)
    hurdle2.append(Int(readLine()!)!)
}

// 풀이
hurdle1.sort()
hurdle2.sort()

func binarySearch(_ arr: [Int], _ target: Int, isLower: Bool) -> Int {
    var start = 0
    var end = arr.count
    
    while start < end {
        let mid = (start + end) / 2
        
        if arr[mid] == target {
            isLower ? (start = mid + 1) : (end = mid)
        } else if arr[mid] < target {
            start = mid + 1
        } else {
            end = mid
        }
    }
    
    return start
}

var dict = [Int:Int]()  // 장애물수:개수
var MIN = Int(1e9)
for height in 1 ... h {
    var cnt = 0
    cnt += hurdle1.count - binarySearch(hurdle1 ,height, isLower: true)
    cnt += hurdle2.count - binarySearch(hurdle2, h - height, isLower: false)
    
    if dict.keys.contains(cnt) {
        dict[cnt]! += 1
    } else {
        dict[cnt] = 1
        MIN = min(MIN, cnt)
    }
}

// 출력
print(MIN, dict[MIN]!)
