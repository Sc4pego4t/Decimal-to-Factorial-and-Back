//
//  main.swift
//  gg
//
//  Created by Andrew on 20.02.2020.
//  Copyright © 2020 ru.spb.iac. All rights reserved.
//

import Foundation

func findFactOf(_ num: Int) -> Int {
	if num == 0 { return 1 }
	
	return (1...num).reduce(1, *)
}

var valuePull: Dictionary<Int, Character> {
	var set = Dictionary<Int, Character>()
	
	(0...9).forEach { set[$0] = Character(String($0)) }
	(0..<26).forEach { set[$0 + 10] = Character(UnicodeScalar("A".unicodeScalars.first!.value + UInt32($0))!) }
	
	return set
}

func dec2FactString(_ nb: Int) -> String {
	var factValue = 1
	var result = 1
	while result * factValue < nb {
		result *= factValue
		factValue += 1
	}
	
	var remained = nb
	let array: [Character] = (0..<factValue).reversed().map {
		let factorResult = findFactOf($0)
		let multiplies = remained / factorResult
		remained -= factorResult * multiplies
		return valuePull[multiplies]!
	}
	
	return String(array)
}

func factString2dDec(_ s: String) -> Int {
	s.enumerated().map { index, char in
		(s.count - index - 1, valuePull.first { $0.value == char}!.key)
	}.compactMap { factorial, multiplies in
		if multiplies > 0 {
			return findFactOf(factorial) * multiplies
		} else {
			return nil
		}
	}.reduce(0, +)
}
