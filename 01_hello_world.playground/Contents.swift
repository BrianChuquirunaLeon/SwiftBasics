import UIKit

var greeting = "Hello, playground"

print(greeting)

let maximunNumberOfloginAttempts = 3

var currenLoginAttempt = 0

var x = 0.0, y = 0.0, z = 0.0

var welcomeMessage : String

welcomeMessage = "Hola, '¿que tal?"

var red, green, blue : Double

let π = 3.141592
let pi = 3.141592
var 😇 = "Angel"

print(😇)
😇 = "Angel2"

print("El numero de login actual es: \(currenLoginAttempt) \nde un total disponible de: \(maximunNumberOfloginAttempts)")


//Este es un comentario

/*Esto es un comentario
 ocupa varias lineas
 /*Este es un comentario anidado*/
 y puedo escribir odcdcsdjc*/

let age = 31

let minValue = UInt8.min

let maxValue = UInt8.max

let maxValueInt = Int8.max
let minValueInt = Int8.min


let f1:Float = 3.14159265
let d1:Double = 3.14159265

let decimalInteger = 17 // 1*10 + 7
let binaryInteger = 0b10001 // 1*2^4 + 1*2^0
let octalInteger = 0o21 // 2*8^1 + 1*8^0
let hexadecimalInteger = 0x11 //1*16^1+1*16^0

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

let paddedDouble = 000123.456
let someNumber = 00000097.540

let oneMillion = 1_000_000
let justMoreThanaMillion = 1_000_000.000_000_1

let twoThousand:UInt16 = 2_000
let one:UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

let three = 3
let decimalNumber = 0.14159
let piNum = Double(three) + decimalNumber

let integerPi = Int(piNum)

typealias AudioSample = UInt16

var maxAmplitude = AudioSample.max //UInt16.max

let orangesAreOrange = true
let foodIsDelicious = false

var isAged : Bool
isAged = true

if isAged {
    print("Puedes entrar en la fiesta")
}else{
    print("No puedes pasar a la fiesta")
}

var age2 : UInt8 = 31

if age2 >= 18{
    print("puedes entrar en la fiesta")
}


// TUPLAS
let http404Error = (404, "Pagina no encontrada")
let (statusCode,statusMessage) = http404Error

print("El código del estado es \(statusCode)")
print ("El mensaje del servidor es \(statusMessage)")

let (justStatusCode, _) = http404Error
print("El código del estado es \(justStatusCode) ")

print("El código del error es \(http404Error.0) y el mensaje es \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")
print("El código del estado es \(http200Status.statusCode) y el mensaje es \(http200Status.description)")

let possibleAge = "5"
let convertedAge = Int(possibleAge) //Int?

var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveyAnsWer : String?
surveyAnsWer = "42"

if convertedAge != nil {
    print("La edad del usuario no es nula: \(convertedAge!)")
}else{
    print("La edad del usuario es nula")
}

if let actualAnswer = surveyAnsWer{
    //AL llegar aqui, surveyAnswer != nil
    print("El string \(surveyAnsWer) tiene el valor \(actualAnswer)")
}else{
    print("El string \(surveyAnsWer) es nil... ")
}

if let firsNumber = Int("4"), let secondaNumber = Int("42"), firsNumber < secondaNumber && secondaNumber < 100 {
        print("\(firsNumber) < \(secondaNumber) < 100")
}

let possibleString: String? = "Un string opcional"
//let forcedString: String = possibleString!

let assumedString: String! = "Un string unwrapped de forma implicita a partir de un optional"
let implicitString: String = assumedString

//igual se puede hacer esto
if assumedString != nil {
    print(assumedString!)
}

if let definitiveString = assumedString{
    print(definitiveString)
}

func canThrowError() throws{
    //aqui hay codigo que puede causar un error
}

do{
    try canThrowError()
    //si llegamos aqui, no hay error
}catch{
    //si llegamos aqui, hay error
}

func makeASandwich() throws{
    
}

do{
    try makeASandwich()
    //me como le sandwich
}catch{
    //tengo platos limpios... -> Lavar los platos
    //tengo ingredientes -> Ir a hacer la compra
    //no tengo hambre -> esperar dentro de una hora
}

//Aserciones (debug) y precondiciones (build)

let age4 = -5
precondition(age4>=0,"La edad de una persona no puede ser negativa")
//..aqui el codigo sigue

if age4 > 10 {
    print("Puedes subir a la montaña rusa")
}else if age >= 0 {
    print("Eres demasiado pequeño para subir a la montaña rusa")
}else{
    assertionFailure("La edad de una persona no puede ser negativa")
}
