//
//  main.swift
//  Lesson3_Complex_Data_Types
//
//  Created by Evgeniy Kozionov on 23.12.2020.
//

import Foundation

/*
 Урок 3. Комплексные типы данных
 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль.
 */

enum engineState {
    case start, stop
}

enum trankState {
    case full, empty
}

enum windowState {
    case open, close
}

struct car {
    let brandCar: String
    let yearOfProduction: Int
    
    var trankState : trankState
    mutating func emptyTruck() {
        self.trankState = .empty
        print("\(brandCar) багажник пустой")
    }
    
    var trankVolume: Double {
        willSet {
            if  (newValue < trankVolume) && (trankState == .empty) && (trankVolume > 0) && (trankVolume != 0)  {
                let space = trankVolume - newValue
                print("\(brandCar) в багажнике еще свободно  \(space)")
            } else {
                print("\(brandCar) багажник переполнен")
            }
        }
    }
    
    var engineState: engineState {
        willSet {
            if (newValue == .start) {
                print("\(brandCar) двигатель заведен")
            } else {
                print("\(brandCar) не заведена")
            }
        }
    }
    
    var windowState : windowState {
        willSet {
            if newValue == .open {
                print("\(brandCar) окна открыты")
            } else {
                print("\(brandCar) окна закрыты")
            }
        }
    }
    func getInfo() -> String {
        return "Марка машины \(brandCar) Год выпуска: \(yearOfProduction) Объем багажника: \(trankVolume)"
        
    }
    
}

struct truck {
    let brandCar: String
    let yearOfProduction: Int
    
    var trankState : trankState
    mutating func emptyTruck() {
        self.trankState = .empty
        print("\(brandCar) багажник пустой")
    }
    
    var trankVolume: Double {
        willSet {
            if  (newValue < trankVolume) && (trankState == .empty) && (trankVolume > 0) && (trankVolume != 0)  {
                let space = trankVolume - newValue
                print("\(brandCar) в багажнике еще свободно  \(space)")
            } else {
                print("\(brandCar) столько в багажник не войдет")
            }
        }
    }

    var engineState: engineState {
        willSet {
            if newValue == .start {
                print("\(brandCar) двигатель заведен")
            } else {
                print("\(brandCar) не заведена")
            }
        }
    }
    
    var windowState : windowState {
        willSet {
            if newValue == .open {
                print("\(brandCar) окна открыты")
            } else {
                print("\(brandCar) окна закрыты")
            }
        }
    }
    func getInfo() -> String {
        return "Марка грузовика \(brandCar) Год выпуска: \(yearOfProduction) Объем кузова: \(trankVolume)"
        
    }
}


var car1 = car(brandCar: "LADA", yearOfProduction: 2002, trankState: .full, trankVolume: 500, engineState: .start, windowState: .close)
var car2 = car(brandCar: "Нива", yearOfProduction: 1980, trankState: .empty, trankVolume: 50, engineState: .start, windowState: .open)

var truck1 = truck(brandCar: "Камаз", yearOfProduction: 2010, trankState: .full, trankVolume: 20000, engineState: .start, windowState: .close)
var truck2 = truck(brandCar: "ЗИЛ", yearOfProduction: 2015, trankState: .empty, trankVolume: 15000, engineState: .start, windowState: .open)


print("Первая машина: \(car1.getInfo())")
print("Вторая машина: \(car2.getInfo())")
print("Первый грузовик: \(truck1.getInfo())")
print("Второй грузовик: \(truck2.getInfo())")



car1.engineState = .start
car1.windowState = .open
car1.trankVolume = 10

car2.trankVolume = 10
car2.engineState = .start
car2.engineState = .stop
car2.windowState = .open


truck1.engineState = .stop
truck1.windowState = . close
truck2.trankVolume = 14000
