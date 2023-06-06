//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/12.
//
// 14226 : 이모티콘
// https://www.acmicpc.net/problem/14226

import Foundation

let s = Int(readLine()!)!

let SIZE = 1001
var visited = [[Bool]](repeating: [Bool](repeating: false, count: SIZE), count: SIZE)
visited[1][0] = true

// (화면, 클립보드, 시간)
var queue = [(1,0,0)]
var idx = 0

while idx < queue.count {
    let (now, clip, time) = queue[idx]
    idx += 1
    
    // 종료 조건
    if now == s {
        print(time)
        break
    }
    
    // 1. 복사
    if !visited[now][now] {
        visited[now][now] = true
        queue.append((now, now, time+1))
    }
    
    // 2. 붙여넣기
    if clip > 0, now + clip < SIZE,
       !visited[now + clip][clip] {
        visited[now + clip][clip] = true
        queue.append((now + clip, clip, time+1))
    }
    
    // 3. 삭제
    if now-1 >= 0, clip < SIZE,
        !visited[now-1][clip] {
        visited[now-1][clip] = true
        queue.append((now-1, clip, time+1))
    }
}
