import UIKit

//-----------------------------operaciones ternarias--------------------------------
let contentHeight = 40
var hasImage = true
var rowHeight = 0

if hasImage {
    rowHeight = contentHeight + 50
}else{
    rowHeight = contentHeight + 10
    
}

rowHeight = contentHeight + (hasImage ? 50 : 10)

//--------------------------------Nil Coalescing operator-------------------------
let defaultAge = 18
var userAge: Int?

//ageToBeUsed = (userAge != nil ? userAge! : defaultAge)
var ageToBeUsed = userAge ?? defaultAge

let defaultColorName = "red"
var userColorName: String?

var colorNameToUse = userColorName ?? defaultColorName

//-----------------------------------Rangos-----------------------------------------
for idx in 1...5 {
    print(idx)//imprime 12345
}

for idx in 1..<5 {
    print(idx)//imprime 1234
}

let names = ["0.Ricardo", "1.Juan Gabriel", "2.Pedro"]
for i in 0..<names.count {
    print("La persona \(i+1) se llama \(names[i])")
}

for name in names[0...] {
    print (name)
}

for name in names[...2] {
    print (name)
}

for name in names[..<2] {
    print (name)
}

let range = ...5 // -infinity...5
range.contains(7)
range.contains(4)
range.contains(-2)
print(range)

//-----------------------------operadores logicos-----------------------------------

let allowEntry = false

if !allowEntry{
    print("ACCESO DENEGADO")
}

let enterDoorCode = true
let passRetinaScan = false

if enterDoorCode && passRetinaScan { //AND
    print("Bienvenido a la empresa")
}else {
    print("ACCESO DENEGADO")
}

if enterDoorCode || passRetinaScan { //AND
    print("Bienvenido a la empresa")
}else {
    print("ACCESO DENEGADO")
}

//-----------------------------------String-------------------------------------
let someString = "Soy un string cualquiera"

let multiLineString = """
    soy un string multilena\
    y puedo estar en
    varias lineas
"""

print(multiLineString)

let wiseWords = " \"La imaginacion es mas importante que el saber\" - Albert Einsten"
let dolarSign = "\u{24}"
let blackHeart = "\u{2665}"
let heart = "te \u{1F496}"

var emptyString  = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
    print ("Nada que ver aquí")
} else{
    print("El string tiene un valor")
}
 var newSomeString = "Un caballo"
newSomeString += "y un carruaje"
newSomeString += "y un soldado"

var a = "A"
var b = "B"
print("a vale \(a) y b vale \(b) ")
b = a
print("a vale \(a) y b vale \(b) ")
b = "C"
print("a vale \(a) y b vale \(b) ")

//---------------------------------Characters-------------------------------
let name = "Brian Chuquiruna"

for ch in name{
    print(ch)
}
print(name.count)

let exclamationMark: Character = "!"

let nameChars: [Character] = ["B", "R", "I", "A", "N"]
var nameString = String(nameChars)

let conpoundName = "Brian" + "Chuquiruna"

nameString.append(exclamationMark)

let multiplier = 3
var message = "El producto de \(multiplier) x 3.5 da \(Double (multiplier)*3.5)"
message.append (exclamationMark)

let greeting = "Hola, ¿que tal?"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting .startIndex)]

for idx in greeting.indices{
    print("\(greeting[idx]) - \(idx)")
}

for idx in greeting.indices{
    print("\(greeting[idx])", terminator:" ")
}

var welcome = "Hola"

welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf: " que tal", at: welcome.index(before: welcome.endIndex))

welcome.remove(at: welcome.index(before: welcome.endIndex))
welcome

let range1 = welcome.index(welcome.endIndex, offsetBy: -3)..<welcome.endIndex
welcome.removeSubrange(range1)
welcome

greeting
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
let firsPart = greeting[..<index]
firsPart //esto es un substring, porlo tanto aunque se ve igual que un String, este no lo es y por lo tanto no podemos acceder a las funcionalidaes de un String
let newString = String(firsPart)

let newGreeting = "Hola, soy Juan Gabriel"
newGreeting.hasPrefix("Hola")
newGreeting.hasSuffix("1")

let collection = [
    "Act 1 Scene 1", "Act 1 Scene 2","Act 1 Scene 3", "Act 1 Scene 4", "Act 1 Scene 5",
    "Act 2 Scene 1", "Act 2 Scene 2","Act 2 Scene 3",
    "Act 3 Scene 1", "Act 3 Scene 2"
]

var act1SceneCount = 0

for scene in collection{
    if scene.hasPrefix("Act 1"){
        act1SceneCount += 1
    }
}

print("El número de escenas del acto 1 es: \(act1SceneCount)")

let ghost = "¡¡Fantasma!! 👻"

for codeUnit in ghost.utf8{
    print (codeUnit, terminator: " ")
}
print(" ")

for codeUnit in ghost.utf16{
    print (codeUnit, terminator: " ")
}
print(" ")

for codeUnit in ghost.unicodeScalars{
    print (codeUnit, terminator: " ")
}
print(" ")

//-----------------------------Collections----------------------------------------
//*********Array*********
var someInts = [Int]()
someInts.count
someInts.append(31)
someInts.count
someInts = []

var someDoubles = Array(repeating: 3.141592, count: 7)
someDoubles.count

var moreDoubles = Array(repeating: 2.5, count: 4)

var aLotOfDoubles = someDoubles + moreDoubles
aLotOfDoubles.count

var shoppingList:[String] = ["papas", "pimiento", "Tortillas", "cerdo"]
shoppingList.count

if shoppingList.isEmpty{
    print("LA lista de la compra esta vacia")
}else{
    print("Mandemos a comprar")
}

shoppingList.append("Coca cola")
shoppingList.count

shoppingList += ["Totopos", "Guacamole", "Pico de gallo"]
shoppingList.count

var firsElement = shoppingList[0]
shoppingList[0] = "Huevos"
shoppingList
shoppingList[4...6] = ["Naranja", "Platano", "Mango"]
shoppingList

let pepper = shoppingList.remove(at: 1)
pepper

let _ = shoppingList.removeLast()
shoppingList

for item in shoppingList {
    print(item)
}

for (idx,item) in shoppingList.enumerated(){
    print("Item \(idx+1) : \(item)")
}

//*********Conjuntos***********
var letters = Set<Character>()
letters.count
letters.insert("a")
letters.insert("h")
letters.insert("b")
letters

var favouriteGames : Set<String> = ["Final Fantasy", "World of Warcraft", "Farcry" ]
favouriteGames.count

if favouriteGames.isEmpty{
    print("No hay juegos favoritos")
}

favouriteGames.insert("Metal Gear")
if let removedGame = favouriteGames.remove("Farcry") {
    print("He eliminado de la lista \(removedGame)")
}

if favouriteGames.contains ("Metal Gear") {
    print ("Me encanta ese juego" )
}

for vg in favouriteGames.sorted() {
    print(vg)
}

let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let primeNumbers: Set = [2,3,5,7]

//A union B = elementos que son o bien de A, o bien de B o de los dos
oddDigits.union(evenDigits).sorted()
//A interseccion B = elementos que son a la vez de A y de B
oddDigits.intersection(evenDigits)
evenDigits.intersection (primeNumbers) .sorted ()
oddDigits.intersection(primeNumbers).sorted()
// A - B = elementos que son de A pero no de B
oddDigits.subtracting(primeNumbers).sorted()
// A + B = (A-B) union (B-A)
oddDigits.symmetricDifference(primeNumbers).sorted()

let houseAnimals:Set = ["🐶", "😹"]
let farmAnimals:Set = ["🐮", "🐔", "🐑","🐶", "😹"]
let cityAnimals:Set = ["🐁", "🕊️"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
//son disjuntos si su interseccion es vacia
farmAnimals.isDisjoint(with: cityAnimals)


//*******Diccionarios[kl:v1, K2:v2, ....]**********
var namesOfIntegers = [Int : String]()
namesOfIntegers[15] = "quince"
namesOfIntegers = [:]

var airports: [String:String] = ["XYZ": "Toronto", "DUB":"Dublin", "PMI": "Palma de mallorca"]
airports.count
airports.isEmpty
airports["LHR"] = "London City Airport"
airports
airports["LHR"] = "London Heathrow"
airports

if let oldValue = airports.updateValue ("Dublin Airport", forKey: "DUB"){
    print ("El aeropuerto tenia antiguamente el nombre de \(oldValue)")
}

if let airportName = airports[ "DUB" ]{
    print("El aeropuerto de DUB es: \(airportName)")
}

airports[ "PMI"] = nil//elima el elemento con esta clave
airports

if let removedAirport = airports.removeValue (forKey: "DUB" ){
    print("Se ha eliminado el aereopuerto: \(removedAirport)")
}
airports

for (key,value) in airports {
    print("\(key) - \(value)")
}

for airportKey in airports.keys{
    print(airportKey)
}

for airportName in airports.values{
    print(airportName)
}

let airportKeys = [String](airports.keys.sorted())
let airportNames = [String](airports.values.sorted())


//-------------------------- Ciclo For in ----------------------------------------------
let namess = ["Ricardo Celis", "Juan Gabriel", "Edgar"]

for name in namess {
print("Hola \(name)")
}

let numberOfLegs = ["spider": 8, "ant": 6, "dog": 4]

for (animalName, legCount) in numberOfLegs{
    print ("Animal: \(animalName) , número de patas: \(legCount)")
}

for idx in 1...5{
    print("\(idx) × 3 = \(idx*3)")
}


let base = 2
let power = 10
var answer = 1

for _ in 1..<power{
    answer *= base
    print(answer)
}

var hour = 9
let minutes = 60
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval){
    print("\(hour) : \(tickMark)")
}


//--------------------------------Bucle While----------------------------------
var i = 0
while i <= 10 {
    i += 1
}
print(i)

//esto es equivalente a un  "do while" en c++
repeat{
    i += 1
}while i <= 10

print(i)

//---------------------------------If else--------------------------------------
var temp = 18
if temp <= 15 {
    print("Hace frio! Enciende la calefaccion")
}else if temp >= 25{
    print( "Hace calor! Encendamos el aire acondicionado")
}else{//15 < temp < 25
    print ("La sensación térmica es agradable. No hace falta modificarla")
}

//-----------------------------Switch case--------------------------------------

let someCharacter2:Character = "z"
switch someCharacter2 {
    case "a", "A":
        print("Es la primera letra del alfabeto")
    case "z", "Z": 
        print("Es la ultima letra del alfabeto")
    default:
        print("Es alguna otra letra")
}

let moons = 62
let phrase = "lunas en Saturno"
let naturalCount: String
switch moons{
case 0:
    naturalCount = "No hay"
case 1..<5:
    naturalCount = "Hay pocas"
case 5..<12:
    naturalCount = "Hay bastantes"
case 12..<100:
    naturalCount = "Hay decenas de"
case 100..<1000:
    naturalCount = "Hay centenares de"
default:
    naturalCount = "Hay muchiiiiisimas"
}
print("\(naturalCount) lunas en saturno")

let somePoint = (1,1)
switch somePoint{
case (0,0):
    print("El punto \(somePoint) es el origen de coordenadas")
case (_,0):
    print("El punto \(somePoint) se halla sobre el eje de las X")
case (0,_):
    print("El punto \(somePoint) se halla sobre el eje de las X")
case (-2...2, -2...2):
    print("El punto \(somePoint) se halla en el interior del cuadrado de lado 4")
default:
    print ("El punto \(somePoint) está en algún otro lado")
}

let anotherPoint = (7,2)
switch anotherPoint{
case (let x ,0):
    print("Sobre el eje de las X, con valor \(x)")
case (0,let y):
    print("Sobre el eje de las X, con valor \(y)")
case let (x,y) where x == y:
    print ("El punto se halla sobre la recta x = y")
case let (x,y) where x == -y:
    print ("El punto se halla sobre la recta x = -y")
case let (x,y):
    print("En algún otro lugar del plano, en (\(x), \(y))")
}

let anotherCharacter:Character = "f"
switch anotherCharacter{
case "a", "e", "i", "o", "u":
    print("Se trata de una vocal")
case "b", "c", "d", "f", "g": //TODO: acabar con el resto del abecedario (solo consonantes)
    print("Se trata de una consonante")
default:
    print("Se trata de un caracter no vocal ni consonante (minusculas)")
}

let stillAnotherPoint = (9,0)

switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("Se halla sobre el eje, a distancia \(distance) del origen")
default:
    print("No está sobre el eje")
}

//--------------------------------Control Transfer Sentences-----------------------------------

//******** continue, break*************
let sentence = "las mentes grandes piensan igual"
var filteredSentence = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u"]

for ch in sentence{
    if charactersToRemove.contains(ch){
        continue
    }
    filteredSentence.append(ch)
    if ch == "d"{
        break
    }
}
filteredSentence

//******** fallthrough *************

let integerToDescribe = 5
var description = "El número \(integerToDescribe) es"

switch integerToDescribe{
case 2,3,5,7,11, 13, 17,19:
    description += " un numero primo y"
    fallthrough
default:
    description += " un numero entero"
}
print(description)

//******** guard, return*************

var people = ["name": "Juan Gabriel", "age": 31, "isMale": true] as [String : Any]

func testUserValidation (person: [String: Any]){
    
    guard let surname = people["surname"] else{
        //aqui no existe el surname
        print("El apellido es desconocido")
        return
    }
    //aqui existe surname
    print(surname)
    
    guard let name = people["name"] else{
        //aqui no existe el name
        print("El nombre es desconocido")
        return
    }
    //aqui existe name
    print(name)
    
    guard let age = people["age"] else{
        //aqui no existe el age
        print("El nombre es desconocido")
        return
    }
    //aqui existe age
    print(age)
}

testUserValidation(person: people)


//--------------------------Available en API: MAnejo de versiones----------------------------------
if #available(iOS 12, macOS 10.12, *){
    //ejecutar las acciones a lo iOS12+, a los macOS12+
}else{
    //Mantener el código viejo con versiones anteriores de iOS, macos...
}
