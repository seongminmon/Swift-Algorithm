//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/04.
//
// 16506 : CPU
// https://www.acmicpc.net/problem/16506

import Foundation

let n = Int(readLine()!)!
var orders = [[String]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ String($0) }
    orders.append(input)
}

for order in orders {
    var result = ""
    
    // opcode
    switch order[0] {
    case "ADD": result += "00000"
    case "ADDC": result += "00001"
    case "SUB": result += "00010"
    case "SUBC": result += "00011"
    case "MOV": result += "00100"
    case "MOVC": result += "00101"
    case "AND": result += "00110"
    case "ANDC": result += "00111"
    case "OR": result += "01000"
    case "ORC": result += "01001"
    case "NOT": result += "01010"
    case "MULT": result += "01100"
    case "MULTC": result += "01101"
    case "LSFTL": result += "01110"
    case "LSFTLC": result += "01111"
    case "LSFTR": result += "10000"
    case "LSFTRC": result += "10001"
    case "ASFTR": result += "10010"
    case "ASFTRC": result += "10011"
    case "RL": result += "10100"
    case "RLC": result += "10101"
    case "RR": result += "10110"
    case "RRC": result += "10111"
    default: break
    }
    
    var isRb = false
    if result.last == "0" {
        isRb = true
    }
    result += "0"
    
    // rD
    var rD = String(Int(order[1])!, radix:2)
    while rD.count < 3 {
        rD.insert("0", at: rD.startIndex)
    }
    result += rD
    
    // rA
    var rA = String(Int(order[2])!, radix:2)
    while rA.count < 3 {
        rA.insert("0", at: rA.startIndex)
    }
    result += rA
    
    // rB, #C
    if isRb {
        var rB = String(Int(order[3])!, radix:2)
        while rB.count < 3 {
            rB.insert("0", at: rB.startIndex)
        }
        result += rB
        result += "0"
    } else {
        var c = String(Int(order[3])!, radix:2)
        while c.count < 4 {
            c.insert("0", at: c.startIndex)
        }
        result += c
    }
    
    print(result)
}
