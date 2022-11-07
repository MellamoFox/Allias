//
//  QuestionBrain.swift
//  Millioneros
//
//  Created by VT on 07.11.2022.
//

import Foundation

struct QuestionBrain {
    var questionIndex = 0
    var questionNumber = 1
    var usedQuestions = Set<Int>()
    let helpButtons = ["50/50", "Call", "Hall"]
    let winArray = [0,100,200,300,500,1000,2000,4000,8000,32000,64000,125000,250000,500000,1000000]
    
    let quizEasy = [
        Question(q: "Что растёт в огороде? ", a: ["Лук", "Пистолет", "Пулемёт", "Ракета СС-20"], correctAnswer: "Лук"),
        Question(q: "Как называют микроавтобусы, совершающие поездки по определённым маршрутам?", a: ["Рейсовка", "Путёвка", "Курсовка", "Маршрутка"], correctAnswer: "Маршрутка"),
        Question(q: "О чём писал Грибоедов, отмечая, что он «нам сладок и приятен» ?", a: ["Дым Отечества", "Дух купечества", "Дар пророчества", "Пыл девичества"], correctAnswer: "Дым Отечества"),
        Question(q: "Какого персонажа нет в известной считалке «На золотом крыльце сидели» ?", a: ["Сапожника", "Кузнеца", "Короля", "Портного"], correctAnswer: "Кузнеца"),
        Question(q: "Какой специалист занимается изучением неопознанных летающих объектов?", a: ["Кинолог", "Уфолог", "Сексопатолог", "Психиатр"], correctAnswer: "Уфолог"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir", "test"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue", "test"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin", "test"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile", "test"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland", "test"], correctAnswer: "Australia")
    ]
    
    let quizMedium = [
        Question(q: "Как называется разновидность воды, в которой атом водорода замещён его изотопом дейтерием?", a: ["Лёгкая", "Средняя", "Тяжёлая", "Невесомая"], correctAnswer: "Тяжёлая"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100", "test"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time", "test"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet", "test"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch", "test"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir", "test"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue", "test"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin", "test"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile", "test"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland", "test"], correctAnswer: "Australia")
    ]
    
    let quizHard = [
        Question(q: "Какой химический элемент назван в честь злого подземного гнома?", a: ["Гафний", "Кобальт", "Бериллий", "Теллур"], correctAnswer: "Кобальт"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100", "test"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time", "test"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet", "test"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch", "test"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir", "test"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue", "test"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin", "test"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile", "test"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland", "test"], correctAnswer: "Australia")
    ]
    
    func getQuestion() -> Question {
        switch questionNumber  {
        case 1...5:
            return quizEasy[questionIndex]
        case 6...10:
            return quizMedium[questionIndex]
        case 11...15:
            return quizHard[questionIndex]
        default: return quizEasy[questionIndex]
        }
        
    }
    
     mutating func nextQuestion() {
         questionNumber += 1
         switch questionNumber {
         case 1...5:
             usedQuestions.insert(questionIndex)
             for _ in 0..<quizEasy.count {
                 let randomNumber = Int.random(in: 0..<quizEasy.count)
                 if !usedQuestions.contains(randomNumber) {
                     questionIndex = randomNumber
                     return
                 }
             }
         case 6...10:
             if questionNumber == 6 {
                 usedQuestions = []
             }
             usedQuestions.insert(questionIndex)
             for _ in 0..<quizMedium.count {
                 let randomNumber = Int.random(in: 0..<quizMedium.count)
                 if !usedQuestions.contains(randomNumber) {
                     questionIndex = randomNumber
                     return
                 }
             }
         case 11...15:
             if questionNumber == 11 {
                 usedQuestions = []
             }
             usedQuestions.insert(questionIndex)
             for _ in 0..<quizHard.count {
                 let randomNumber = Int.random(in: 0..<quizHard.count)
                 if !usedQuestions.contains(randomNumber) {
                     questionIndex = randomNumber
                     return
                 }
             }
         default: break
         }
         
        
         
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        //Need to change answer to rightAnswer here.
        switch questionNumber {
        case 1...5:
            if userAnswer == quizEasy[questionIndex].rightAnswer {
                return true
            } else {
                return false
            }
        case 6...10:
            if userAnswer == quizMedium[questionIndex].rightAnswer {
                return true
            } else {
                return false
            }
        case 11...15:
            if userAnswer == quizHard[questionIndex].rightAnswer {
                return true
            } else {
                return false
            }
        default: return false
        }
        
    }
}
