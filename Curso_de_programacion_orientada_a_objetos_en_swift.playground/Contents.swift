import UIKit

//------------------------------------Struct vs Class--------------------------------------------------
struct SomeStruct{
    //La definicion de la estructura aqui
    
}

class SomeClass{
    //La difinicion de la clase aqui
}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name:String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

print(someResolution.width)
someVideoMode.resolution.width = 1280
print(someVideoMode.resolution.width = 1280)

let vga = Resolution(width: 640, height: 480)
vga.width
vga.height

let hd = Resolution(width: 1920, height: 1080)

var cinema = hd
print("\(cinema.width) × \(cinema.height)")
cinema.width = 2048
print("\(cinema.width) × \(cinema.height)")
print("\(hd.width) × \(hd.height)")

enum CompassPoint{
    case north, south, east, west
}

var currentDirection = CompassPoint.north
var oldDirection = currentDirection
currentDirection = .south

print(currentDirection)
print(oldDirection)

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
tenEighty

if tenEighty === alsoTenEighty{//!==
    print("son el mismo objeto")
}else{
    print("Son diferentes")
}

//-----------------------------------------Properties---------------------------------------------------

//*********Stored Property***********
struct FixedLengthRange{
    var firstaValue : Int
    let length : Int
}

var rangeOfThreeItems = FixedLengthRange(firstaValue: 0, length: 3 )
rangeOfThreeItems.firstaValue = 6

//********Lazy Property**************
class DataImporter {
    var filename = "data.txt"
    lazy var filname2 = "otraData.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Algo de datos")
manager
manager.importer.filename
manager

//********Computed Property**************

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point{
        get{
            //let centerX = origin.x + size.width/2
            //let centerY = origin.y + size.width/2
            // return Point(x: centerX, y: centerY)
            Point(x: origin.x + size.width/2, y: origin.y + size.width/2)
        }
       /*set(newCenter){
            origin.x = newCenter.x - size.width/2
            origin.y = newCenter.y - size.height/2
        }*/
        set{//cuando creas un "set" automaticamente se crea una variable
            //new value, que es del mismo tipo de dato que se define en la variable
            origin.x = newValue.x - size.width/2
            origin.y = newValue.y - size.height/2
        }
    }
}

var square = Rect(origin: Point(x:0,y:0), size: Size(width: 10, height: 10))
let initialSquareCenter = square.center
square.center = Point(x: 20,y: 20)
square.center

//******* Computed Property de solo lectura **********
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume : Double { width * height * depth }//swift sabe que esto es un "get"
}

let cuboid = Cuboid(width: 4.0,height: 5.0 , depth: 2.0)
cuboid.volume

//******** Property Observers **************

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps){//este es un observador que se ejecuta antes que la variable cambia de valor
            print("El numero de pasos va a subir hasta \(newTotalSteps)")
        }
        didSet{//este es un observador que se ejecuta despues que la variable cambia de valor
            if totalSteps > oldValue {
                print ("El número de pasos ha incrementado en \(totalSteps - oldValue)")
            }
        }
    }
    
}
//***********Type Properties***************
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 520
stepCounter.totalSteps += 1234

struct SomeStruct1{
    var counter = 0
    static var storedTypeProperty = "SOME VALUE"
    static var computedTypeProperty:Int{
        return 1
    }
}

var instanceStr = SomeStruct1()
instanceStr.counter
SomeStruct1.computedTypeProperty

enum SomeEnum {//Los enum tambien pueden hacer uso de los atributos estaticos
    static var storedTypeProperty = "SomeValue"
    static var computedTypeProperty: Int{
        return 5
    }
}

SomeEnum.computedTypeProperty

class SomeClass1 {
    static var storedTypeProperty = "SOME VALUE"
    //esta variable estatica no puede ser sobreescrita en los hijos que heradan de esta clase
    static var computedTypeProperty:Int{
        return -9
    }
    //por otro lado, esta variable estatica si puede ser sobreescrita en los hijos que heradan de esta clase
    class var overrideableComputedTypeProperty:Int{
        return 108
    }
}

//---------------------------------------------Metodos-------------------------------------------------------

class Counter {
    var count = 0
    
    func increment(){
        self.count += 1
    }
    
    func increment(by amount:Int) {
        self.count += amount
    }
    
    func reset(){
        self.count = 0
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 5)
counter.reset()

struct Point1{
    var x = 0.0, y = 0.0
    func isToTheRight (of x: Double) -> Bool {
        return self.x > x
    }
    mutating func moveBy(x deltaX:Double, y deltaY:Double){//no es necesario usar mutating en una clase
        //self.x += deltaX
        //self.y += deltaY
        self = Point1(x: self.x + deltaX, y: self.y + deltaY)
    }
}

var somePoint = Point1(x: 4, y: 5)
somePoint.isToTheRight(of: 1)
somePoint.x = 9

enum DifferentStateSwitch{
    case off, low, high
    mutating func next (){//no es necesario usar mutating en una clase
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case . high:
            self = .off
        }
    }
}

var controllerStatus = DifferentStateSwitch.off
controllerStatus.next()
controllerStatus.next()
controllerStatus.next()

class SomeClass2 {
    class func someMethod(){
        print("Hola")
    }
}

SomeClass2.someMethod()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level:Int){
        if level > highestUnlockedLevel{
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level:Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    mutating func advance(to level:Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        }else{
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName:String
    
    func complete(level: Int){
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name:String){
        self.playerName = name
    }
}

var player = Player(name: "Brian Chuquiruna")
player.complete(level: 1)

if player.tracker.advance(to: 7){
    print ( "Podemos avanzar hasta el nivel 7")
}else{
    print("El nivel 7 sigue bloqueado por ahora")
}

//-------------------------------------------------SubIndices-------------------------------------------------------

struct TimesTable {
    let multiplier:Int
    
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTables = TimesTable(multiplier: 3)
print("6×3 = \(threeTimesTables[6])")

for idx in 0...10 {
    print("\(idx) × 3 = \(threeTimesTables[idx])")
}

enum Planet : Int{
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n:Int) -> Planet{
        return Planet(rawValue: n)!
    }
}

let planet = Planet[4]
planet

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(rows:Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows*columns)
    }
    
    func indexIsValid(row:Int, column:Int) -> Bool{
        return row>=0 && column >= 0 && row < rows && column < columns
    }
    
    subscript(row:Int, column: Int) -> Double{
        get{
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[ (row*columns)+column]
        }
        set{
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[ (row*columns)+column] = newValue
        }
    }
}

var matrix = Matrix(rows: 10, columns: 10)
matrix[0,1] = 1.5
matrix[1,0] = 2.5

for row in 0..<matrix.rows{
    for col in 0..<matrix.columns{
        print (matrix[row, col], separator: "" , terminator: " ")
    }
    print("")
}

//----------------------------------------------Herencia------------------------------------------

class Vehicle {
    var currenSpeed = 0.0
    var description: String {
        return "viajando a \(currenSpeed) km/h"
    }
    func makeNoise(){
        //do nothing, porque cada vehículo tiene su propia forma de hacer ruido
    }
}

let someVehicle = Vehicle()
print(someVehicle.description)

class Bicycle : Vehicle{
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currenSpeed = 15.0

print(bicycle.description)

class Tandem : Bicycle{
    var currentNumberOfPassangers = 2
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassangers = 2
tandem.currenSpeed = 22.0
print(tandem.description)

class Train: Vehicle {
    //con "final" nos aseguranos que ninguna clase hijo pueda sobreescribir esta property, pero tambien funciona
    //para los metodos
    final var numberOfWagons = 0
    
    override func makeNoise() {
        print("Choo choo")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicle{
    var gear = 1
    override var description: String{
        return super.description + " en la marcha \(gear)"
    }
}

class AutomaticCar : Car{
    var currentSpeed: Double = 0.0{
        didSet{
            gear = Int (currentSpeed / 15.0) + 1
        }
    }
}

//------------------------------------Constructor o inicializador--------------------------------------

struct Fahrenheit{
    var temperature : Double
    init(){
        self.temperature = 32
    }
}

var f1 = Fahrenheit()

struct Celsius {
    var temperature: Double
    init (fromFahrenheit fahrenheit: Double) {
        self.temperature = (fahrenheit - 32) / 1.8
    }
    init (fromKelvin kelvin:Double) {
        self.temperature = kelvin - 273.15
    }
    init(_ celsius:Double){
        self.temperature=celsius
    }
    
}

let boilingPointOfWater1 = Celsius(fromFahrenheit: 212)
let boilingPointOfWater2 = Celsius(fromKelvin: 273.15)

struct Color {
    let red,green,blue : Double
    init(red:Double,green:Double,blue:Double){
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white:Double){
        self.red = white
        self.green = white
        self.blue = white
    }
}

let magenta = Color(red: 1, green: 0, blue: 1)
let halfGrey = Color(white: 0.5)
let green = Color(red: 0, green: 1, blue:0)

let bodyTemperature = Celsius(37)

class SurveyQuestion {
    var text:String
    var response:String?//no es necesario inicializar en el init esta variable, ya que es optional
    
    init(text:String){
        self.text = text
    }
    
    func ask(){
        print(text)
    }
}

let q1 = SurveyQuestion(text: "¿Te gustan los tacos")
q1.ask()
q1.response = "Si, me encatan todos ellos"

//***init designado y por conveniencia*******
class Vehicle1 {
    var numberOfWheels = 0
    var description: String{
        return "\(numberOfWheels) ruedas"
    }
}

let vehicle = Vehicle1()
vehicle.description

class Bicycle1: Vehicle1{
    override init() {
        super.init ()
        numberOfWheels = 2
    }
}

let bicycle1 = Bicycle1()
bicycle1.description

class Hoverboard: Vehicle{
    var color: String
    init (color: String) {
        self.color = color
        //aqui se llama implicitamente a super.init()
    }
    override var description: String{
        return "\(super.description) en el color \(self.color)"
    }
}

let hoverboard = Hoverboard(color: "Silver")
hoverboard.description

enum TemperatureUnit{
    case kelvin, celsius, fahrenheit
    
    init?(symbol:Character){//este constructor puede devolver nil
        switch symbol{
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

let someUnit = TemperatureUnit(symbol: "X")

//----------------------------------Init nil----------------------------------------
class Product{
    let name:String
    init?(name:String){
        if name.isEmpty{
            return nil
        }
        self.name = name
    }
}

class CartItem:Product {
    let quantity:Int
    init?(name: String,quantity:Int) {
        if quantity < 1{
            return nil
        }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let someSocks = CartItem(name: "Socks", quantity: 2){
    print ("\(someSocks.name) - \(someSocks.quantity)")
}

class Bank{
    static var coinsInBank = 2_000
    static func distribute(coins numberOfCoinsRequested:Int) -> Int{
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsRequested
        return numberOfCoinsToVend
    }
    static func receive (coins: Int){
        coinsInBank += coins
    }
}

class Player2{
    var coinsInPurse:Int
    init(coins:Int){
        self.coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins:Int){
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit{
        Bank.receive(coins:coinsInPurse)
    }
}

var playerOne:Player2? = Player2(coins: 100)
Bank.coinsInBank
playerOne!.win(coins: 2_000)

Bank.coinsInBank

playerOne = nil
Bank.coinsInBank

//------------------------------ Otional Chaining-------------------------------
/*
 class Person {
     var residence:Residence?
 }

 class Residence{
     var numberOfRooms = 1
 }

 let edgar = Person()

 if let roomCount = edgar.residence?.numberOfRooms{
     print("La casa de Edgar tiene \(roomCount) habitacion(es)")
 }else{
     print("Edgar no tiene casa")
 }
*/

class Person{
    var residence:Residence?
}

class Residence{
    var address:Address?
    var rooms = [Room]()
    var numberOfRooms : Int {
        return rooms.count
    }
    subscript(i:Int) -> Room {
        get{
            return rooms[i]
        }
        set{
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms(){
        print("El numero de habitaciones es \(numberOfRooms)")
    }
}

class Room{
    let name: String
    init (name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String?{
        if let buildingNumber = buildingNumber, let street = street{
            return "\(buildingNumber), \(street)"
        }else if buildingName != nil{
            return buildingName
        }else{
            return nil
        }
    }
}

let edgar = Person()

if let roomCount = edgar.residence?.numberOfRooms{
    print ("La casa de Edgar tiene \(roomCount) habitación (es)")
}else{
    print ("Edgar no tiene casa")
}

let someAddress = Address()
someAddress.buildingNumber = "13"
someAddress.street = "calle de Platzi"
edgar.residence?.address = someAddress
edgar

edgar.residence?.printNumberOfRooms()

if edgar.residence?.printNumberOfRooms() != nil{
    print ("He podido obtener el número de habitaciones")
}else{
    print ("NO ha sido posible saber el número de habitaciones")
}

if let firstRoomName = edgar.residence?[0].name {
    print("La primera habitación es de \(firstRoomName)")
}else{
    print ("La primera habitación no sabemos de quien es")
}

edgar.residence?[0] = Room(name: "Bathroom")

