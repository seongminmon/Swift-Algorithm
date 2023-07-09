//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/05/29.
//
// 실행 시간 측정

import Foundation

processTime{
    // Code
}

func processTime(closure: () -> ()){
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let processTime = CFAbsoluteTimeGetCurrent() - start
    print("경과 시간: " + String(format: "%.4f", processTime))
}
