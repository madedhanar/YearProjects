//
//  Question.swift
//  Quizzler
//
//  Created by Made Dhanar Indhira Yoga on 26/04/20.
//  Copyright © 2020 ADA. All rights reserved.
//

import Foundation


struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
          text = q
          answer = a
      }
    
}
