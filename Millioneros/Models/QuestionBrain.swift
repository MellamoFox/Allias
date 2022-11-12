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
    let winArray = [0,100,200,300,500,1000,2000,4000,8000,32000,64000,125000,250000,500000,1000000]
    
    let quizEasy = [
        Question(q: "Что растёт в огороде? ", a: ["Лук", "Пистолет", "Пулемёт", "Ракета СС-20"], correctAnswer: "Лук"),
        Question(q: "Как называют микроавтобусы, совершающие поездки по определённым маршрутам?", a: ["Рейсовка", "Путёвка", "Курсовка", "Маршрутка"], correctAnswer: "Маршрутка"),
        Question(q: "О чём писал Грибоедов, отмечая, что он «нам сладок и приятен» ?", a: ["Дым Отечества", "Дух купечества", "Дар пророчества", "Пыл девичества"], correctAnswer: "Дым Отечества"),
        Question(q: "Какого персонажа нет в известной считалке «На золотом крыльце сидели» ?", a: ["Сапожника", "Кузнеца", "Короля", "Портного"], correctAnswer: "Кузнеца"),
        Question(q: "Какой специалист занимается изучением неопознанных летающих объектов?", a: ["Кинолог", "Уфолог", "Сексопатолог", "Психиатр"], correctAnswer: "Уфолог"),
        Question(q: "Что украшает мачту пиратского судна?", a: ["Кровавая Мэри", "Грязный Гарри", "Бедный Йорик", "Весёлый Роджер"], correctAnswer: "Весёлый Роджер"),
        Question(q: "Как называется одно из блюд?", a: ["Макароны-по-флотски", "Лапша-по-пилотски", "Вермишель-по-солдатски", "Спагетти-по-снайперски"], correctAnswer: "Макароны-по-флотски"),
        Question(q: "Что является характеристикой коллекционного вина?", a: ["Стойкость", "Выдержка", "Выносливость", "Трезвость"], correctAnswer: "Выдержка"),
        Question(q: "Что искал Колумб, а в результате открыл Америку?", a: ["Голливуд", "Диснейленд", "Путь в Индию", "Кафе с гамбургерами"], correctAnswer: "Путь в Индию"),
        Question(q: "Как называется один из конкурсов «КВН»?", a: ["Тренировка", "Разминка", "Шейпинг", "Аэробика"], correctAnswer: "Разминка")
    ]
    
    let quizMedium = [
        Question(q: "Как называется разновидность воды, в которой атом водорода замещён его изотопом дейтерием?", a: ["Лёгкая", "Средняя", "Тяжёлая", "Невесомая"], correctAnswer: "Тяжёлая"),
        Question(q: "Какая страна ежегодно дарит Великобритании к Рождеству роскошную ёлку?", a: ["Финляндия", "Швеция", "Норвегия", "Дания"], correctAnswer: "Норвегия"),
        Question(q: "Какая из перечисленных башен самая низкая?", a: ["Останкинская", "Эйфелева", "Пизанская", "Спасская"], correctAnswer: "Пизанская"),
        Question(q: "Какой напиток получают из сахарного тростника?", a: ["Джин", "Ром", "Коньяк", "Вермут"], correctAnswer: "Ром"),
        Question(q: "Какие пальцы музыканты не используют при игре на арфе", a: ["Большие", "Указательные", "Безымянные", "Мизинцы"], correctAnswer: "Мизинцы"),
        Question(q: "Какое европейское государство является Великим Герцогством?", a: ["Андорра", "Люксембург", "Лихтенштейн", "Монако"], correctAnswer: "Люксембург"),
        Question(q: "Какую птицу американцы традиционно готовят на День Благодарения?", a: ["Курицу", "Индейку", "Гуся", "Утку"], correctAnswer: "Индейку"),
        Question(q: "На территории какой современной страны находился Карфаген?", a: ["Тунис", "Египет", "Судан", "Израиль"], correctAnswer: "Тунис"),
        Question(q: "Каким голосом пел Фёдор Шаляпин?", a: ["Бас", "Тенор", "Баритон", "Фальцет"], correctAnswer: "Бас"),
        Question(q: "Какого цвета нет на государственном флаге Армении?", a: ["Красного", "Синего", "Оранжевого", "Белого"], correctAnswer: "Белого")
    ]
    
    let quizHard = [
        Question(q: "Какой химический элемент назван в честь злого подземного гнома?", a: ["Гафний", "Кобальт", "Бериллий", "Теллур"], correctAnswer: "Кобальт"),
        Question(q: "Какой город США принято считать родиной джаза?", a: ["Чикаго", "Нью-Йорк", "Новый Орлеан", "Сан-Франциско"], correctAnswer: "Новый Орлеан"),
        Question(q: "Премьера какой программы состоялась 1 января 1968 года?", a: ["Время", "Голубой огонёк", "Кинопанорама", "Очевидное-невероятное"], correctAnswer: "Время"),
        Question(q: "Горсть чего бросают перед выходом на ковёр борцы сумо?", a: ["Риса", "Соли", "Сои", "Опилок бамбука"], correctAnswer: "Соли"),
        Question(q: "Какой камень венчает Большую Российскую Императорскую корону?", a: ["Топаз", "Изумруд", "Шпинель", "Сапфир"], correctAnswer: "Шпинель"),
        Question(q: "Сколько куполов у собора Василия Блаженного?", a: ["7", "10", "11", "13"], correctAnswer: "10"),
        Question(q: "Кто первым применил таран в воздушном бою?", a: ["Арцеулов", "Кожедуб", "Нестеров", "Талалихин"], correctAnswer: "Нестеров"),
        Question(q: "Кто из этих легендарных личностей не входит в число трёх братьев, основавших Киев?", a: ["Кий", "Рюрик", "Щек", "Хорив"], correctAnswer: "Рюрик"),
        Question(q: "Какое Евангелие открывает Новый Завет?", a: ["От Луки", "От Марка", "От Иоанна", "От Матфея"], correctAnswer: "От Матфея"),
        Question(q: "Для людей какой профессии делались первые шариковые ручки?", a: ["Журналисты", "Водолазы", "Лётчики", "Учителя"], correctAnswer: "Лётчики")
    ]
    
    func getQuestion() -> Question {
        switch questionNumber  {
        case 0...5:
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
