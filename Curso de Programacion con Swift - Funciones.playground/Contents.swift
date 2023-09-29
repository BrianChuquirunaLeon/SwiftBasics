import UIKit

func greeting (person: String) -> String {//funcion devuelve string
    let greet = "Hola, \(person)!"
    return greet//devuelve greet
}

greeting(person: "Brian Chuquiruna")

func sayHelloWorld() -> String {
    return "Hello World"
}

sayHelloWorld()

func greeting(person: String, isMale:Bool) -> String {
    if isMale {
        return "Bienvenido Caballero \(person)"
    }else{
        return "Bienvenida Señorita \(person) "
    }
}

greeting (person: "Brian Chuquiruna", isMale: true)
greeting (person: "Brayantina", isMale: false)

func greet2(person:String) {// funcion no devuelve nada
    print("Hola \(person)")
}

func minMax(array:[Int]) -> (min: Int, max: Int)? {
    
    if array.isEmpty {return nil}
    
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count]{
        if value < currentMin{
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin,currentMax)
}

let bounds = minMax(array: [6,3,-1,5,10,39,-98])
print("Los valores se halla entre \(bounds!.min) y \(bounds!.max)")

minMax(array: [])

//--------------------Etiquetas Params y Variadics------------------------

func someFunction (f1 firstParamName: Int, f2 secondParamName: Int = 6) {
    //firstParamName variable de tipo Int
    //secondParamName variable de tipo Int
    print(firstParamName + secondParamName)
}

someFunction(f1: 5,f2: 1)
someFunction(f1: 5)

func greeting(_ person: String,from hometown: String) -> String{
    return "Hola \(person) un placer que no visites desde \(hometown)"
}

greeting("Brian Chuquiruna", from: "Casa grande")

func mean (_ numbers:Double...) -> Double{
    var total : Double = 0
    for number in numbers{
        total += number
    }
    return total / Double(numbers.count)
}

mean(1,2,3,4,5)
mean(1.5,1.9)
mean(4,649,-941,984,-96)

var x = 5
func addOne(number:Int){
    var number2 = number
    number2 += 1
    print("El numero ahora vale \(number2)")
}
addOne(number: x)

//Es como pasar parametros con punteros, lo cual causa una modificacion
//afuera de la funcion de la variable que se esta pasando en la funcion
func swapTwoInts(_ a: inout Int, _ b: inout Int){
    let tempA = a
    a = b
    b = tempA
}

var someInt = 3
var otherInt = 7
print("someInt vale \(someInt) y otherInt vale \(otherInt)")
swapTwoInts (&someInt, &otherInt)
print("someInt vale \(someInt) y otherInt vale \(otherInt)")


//------------------funciones como tipo de dato----------------------------

func addTwoInts(_ a:Int, _ b: Int) -> Int{
    return a+b
}// (Int,Int) -> Int

func multiplyTwoInts(_ a:Int, _ b: Int) -> Int{
    return a*b
}// (Int,Int) -> Int

func printHW(){
    print("Hello World")
}// () -> Void

var mathFunction: (Int, Int) -> Int = addTwoInts
mathFunction(4,5)

func printMathResult(_ mathFunc: (Int, Int) -> Int, _ a: Int, _ b: Int){
    print("Resultado: \(mathFunc(a,b))")
}

printMathResult (addTwoInts, 5, 9)



func chooseStepFunction (backward: Bool ) -> (Int) -> Int {
    
    func stepForward(_ input: Int) -> Int {
            return input + 1
    }

    func stepBackward(_ input: Int) -> Int {
            return input - 1
    }
    
    return backward ? stepBackward : stepForward
}

var value = -7
let moveNearerZero = chooseStepFunction(backward: value > 0)
while value != 0{
    print("\(value)...")
    value = moveNearerZero(value)
}

//--------------------------------- closures ------------------------------------------------------


//***********Closures *************

/*
 { (params) -> return type in
    //Codigo closure
 }
 */
 
let names = ["Christian", "Ricardo", "Juan Gabriel","Edgar", "Freddy"]

func backward(_ s1:String, _ s2:String) -> Bool {
    return s1 > s2
}

backward ("Juan Gabriel", "Edgar")
var reversedNames1 = names.sorted(by: backward)
var reversedNames2 = names.sorted(by: {(s1: String, s2:String) -> Bool in return s1 > s2})
var reversedNames3 = names.sorted(by: {s1, s2 in return s1 > s2})
var reversedNames4 = names.sorted(by: {s1, s2 in s1 > s2})
var reversedNames5 = names.sorted(by: { $0 > $1 })
var reversedNames6 = names.sorted(by: > )

//*********** Trailing closures *************
func someFunctionThatTakesAClosure(closure: () -> Void) {
    //Aqui iria el cuerpo de la función
    
}

someFunctionThatTakesAClosure (closure: {
    //Aqui iria el cuerpo del closure
})

someFunctionThatTakesAClosure{
    //Aqui iria el cuerpo del closure
}

let reversedNames = names.sorted{$0>$1}

let digitNames = [0: "Cero", 1: "Uno", 2:"Dos", 3:"Tres", 4: "Cuatro",5: "Cinco", 6:"Seis", 7:"Siete", 8: "Ocho", 9: "Nueve"]
let numbers = [16, 58, 510, 2127]

let numberStrings = numbers.map{ (number) -> String in
    var number = number
    var output = ""
    repeat{
        output = digitNames[number%10]! + output
        number /= 10
    }while number > 0
    return output
}

//*********** Capturing closures *************
func makeIncrementer (forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

//print("abc : \(abc)")
incrementByTen()
incrementByTen()


let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementByTen()

//*********** Escaping closures *************
var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void){
    completionHandlers.append(completionHandler)
}
completionHandlers.count

func someFunctionWithNonEscapingClosure(closure: () -> Void){
    closure()
}

class SomeClass{
    var x = 10
    func doSomething(){
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        someFunctionWithNonEscapingClosure {
            x = 200
        }
    }
    
}

let instance = SomeClass()
print(instance.x)

instance.doSomething()
print(instance.x)

completionHandlers.count
completionHandlers.first?()
print(instance.x)


//----------------------------Enumerations-----------------------------
enum SomeEnumeration{
    //aqui va la definicion del enumerado
}

enum CompassPoint:String{
    case north
    case south
    case east
    case west
}

enum Planet:Int{
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToGo = CompassPoint.east
directionToGo = .west

switch directionToGo{
case .north:
    print("hay que ir al norte")
case .south:
    print ( "Hay pinguinos en el sur")
case .east:
    print ("Mordor se extiende hacia las tierras del este")
case .west:
    print ("Cuidado con los vaqueros")
}

let somePlanet = Planet.earth
switch somePlanet{
case .earth:
    print("La tierra es segura")
default:
    print ("No es seguro ir a este planeta")
}

//este es un enumerado que pude ser iterado en un "For" por ejemplo
enum Beverage : CaseIterable {
    case coffee, tea, juice, redbull
}

let numberOfChoices = Beverage.allCases.count
for beverage in Beverage.allCases{
    print(beverage)
}

enum Barcode{
    case upc(Int,Int,Int,Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("VSDCCEVFG")

switch productBarcode{
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let productCode):
    print ("QR: \(productCode)")
}



let earthOrder = Planet.earth.rawValue

let northDirection = CompassPoint.north.rawValue

let possiblePlanet = Planet(rawValue: 25)

let planetPosition = 11
if let anyPlanet = Planet(rawValue: planetPosition){
    switch anyPlanet{
    case .earth:
        print("La tierra es segura")
    default:
        print("No es seguro ir a este planeta")
    }
}else{
    print("El planeta indicado no existe... ")
}

