//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/03.
//
// 10845 : 큐
// https://www.acmicpc.net/problem/10845

import Foundation

// 입력
let n = Int(readLine()!)!
var orders = [[String]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ String($0) }
    orders.append(input)
}

// 풀이 + 출력
var queue = [Int]()
for str in orders {
    switch str[0] {
    case "push": queue.append(Int(str[1])!)
    case "pop":
        if queue.isEmpty {
            print(-1)
        } else {
            print(queue.removeFirst())
        }
    case "size": print( queue.count )
    case "empty": print( queue.isEmpty ? 1 : 0 )
    case "front":
        if queue.isEmpty {
            print(-1)
        } else {
            print(queue.first!)
        }
    case "back":
        if queue.isEmpty {
            print(-1)
        } else {
            print(queue.last!)
        }
    default: break
    }
}
