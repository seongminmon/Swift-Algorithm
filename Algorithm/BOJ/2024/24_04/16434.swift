//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 4/27/24.
//
// 16434 : 드래곤 앤 던전
// https://www.acmicpc.net/problem/16434

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, startATK) = (input[0], input[1])

var rooms = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    rooms.append(input)
}

var ans = -1
var start = 1
var end = Int(1e6) * Int(1e6) * n
while start <= end {
    let mid = (start + end) / 2
    
    var curHP = mid
    var ATK = startATK
    var flag = true
    for room in rooms {
        let (t, a, h) = (room[0], room[1], room[2])
        
        if t == 1 {
            let warriorCnt = h % ATK == 0 ? h / ATK : h / ATK + 1
            let monsterCnt = curHP % a == 0 ? curHP / a : curHP / a + 1
            
            if warriorCnt <= monsterCnt {
                curHP -= (warriorCnt - 1) * a
            } else {
                flag = false
                break
            }
        } else {
            curHP = min(mid, curHP + h)
            ATK += a
        }
    }
    
    if flag {
        ans = mid
        end = mid - 1
    } else {
        start = mid + 1
    }
}

print(ans)
