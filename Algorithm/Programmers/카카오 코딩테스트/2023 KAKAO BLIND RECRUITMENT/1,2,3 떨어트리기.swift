//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/29.
//
// 1,2,3 떨어트리기
// 2023 KAKAO BLIND RECRUITMENT
// Lv.4
// https://school.programmers.co.kr/learn/courses/30/lessons/150364

import Foundation

func solution(_ edges:[[Int]], _ target:[Int]) -> [Int] {
    let n = target.count
    
    // 그래프 생성
    var graph = [[Int]](repeating: [], count: n+1)
    for edge in edges {
        graph[edge[0]].append(edge[1])
    }
    
    // 자식 노드 오름차순 정렬
    for i in 1...n {
        graph[i].sort()
    }
    
    // 숫자를 떨어트린 횟수
    var leafCnt = [Int](repeating: 0, count: n+1)
    // 길을 선택하는 커서
    var cursor = [Int](repeating: 0, count: n+1)
    // 숫자가 떨어지는 순서
    var order = [Int]()
    
    var flag = true
    while flag {
        // 루트 노드에서 시작
        var node = 1
        
        // 리프노드까지
        while !graph[node].isEmpty {
            // 커서 변경을 위해 이전 값 저장
            let temp = node
            // 선택된 길에 따른 자식 노드 선택
            node = graph[node][cursor[node]]
            
            // 길을 지난 후 커서 변경
            cursor[temp] = (cursor[temp] + 1) % graph[temp].count
        }
        
        // 현재 node: 숫자가 떨어진 리프 노드
        // 횟수 증가
        leafCnt[node] += 1
        // 순서 저장
        order.append(node)
        
        // 가능한지 확인
        flag = false
        for i in 1...n {
            // 리프노드가 아니면 패스
            if !graph[i].isEmpty { continue }
            
            // 1로 모두 떨어트려도 만들 수 없으면 불가능
            if target[i-1] < leafCnt[i] {
                return [-1]
            } else if target[i-1] > leafCnt[i] * 3 {
                // 3만 떨어트려도 못 만드는 경우
                // 숫자를 더 떨어트려야 함
                flag = true
                break
            }
        }
    }
    
    // 최소 횟수와 순서를 구한 상태
    // 사전순으로 빠른 답 구하기
    var target = target
    var result = [Int]()
    for num in order {
        if target[num-1] == leafCnt[num] * 3 {
            result.append(3)
            target[num-1] -= 3
        } else if target[num-1] == leafCnt[num] * 3 - 1 {
            result.append(2)
            target[num-1] -= 2
        } else {
            result.append(1)
            target[num-1] -= 1
        }
        
        // 남은 횟수 감소
        leafCnt[num] -= 1
    }
    
    return result
}

print(solution([[2, 4], [1, 2], [6, 8], [1, 3], [5, 7], [2, 5], [3, 6], [6, 10], [6, 9]], [0, 0, 0, 3, 0, 0, 5, 1, 2, 3]))
print(solution([[1, 2], [1, 3]], [0, 7, 3]))
print(solution([[1, 3], [1, 2]], [0, 7, 1]))
