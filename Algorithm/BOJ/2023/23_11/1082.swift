//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/11/14.
//
// 1082 : 방 번호
// https://www.acmicpc.net/problem/1082

import Foundation

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var m = Int(readLine()!)!

// 0만 구매할 수 있다면
if n == 1 {
    print(0)
    exit(0)
}

var price = [(Int,Int)]()
for i in 0..<n {
    price.append((i, input[i]))
}

// 1순위 : 숫자를 여러 개 사는 것
// 가격 기준 오름차순 정렬
let sortedPrice = price.sorted {
    if $0.1 == $1.1 {
        return $0.0 > $1.0
    } else {
        return $0.1 < $1.1
    }
}

let (minNum, minPrice) = sortedPrice[0]
var result = [Int]()

// 제일 싼게 0이라면
if minNum == 0 {
    // 두번째로 싼 걸 첫자리에 넣기
    if m - sortedPrice[1].1 >= 0 {
        m -= sortedPrice[1].1
        result.append(sortedPrice[1].0)
    } else {
        // 못 산다면 0 출력 후 종료
        print(0)
        exit(0)
    }
}

// 나머지 자리 채우기
if m / minPrice > 0 {
    result += [Int](repeating: minNum, count: m / minPrice)
}
m %= minPrice

// 2순위 : 높은 숫자를 사는 것
for i in 0..<result.count {
    if m == 0 { break }
    
    for j in stride(from: n-1, through: 0, by: -1) {
        // 살 수 있으면 교체
        if m >= price[j].1 - price[result[i]].1 {
            m -= price[j].1 - price[result[i]].1
            result[i] = j
            // 처음 산게 제일 큰 숫자니까 break
            break
        }
    }
}
print(result.map { String($0) }.joined())
