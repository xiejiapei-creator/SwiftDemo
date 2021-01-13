import Foundation

//==========数学运算符============
let a = 10
let b = 3
var result: Int
result = a % b  // 余

//==========区间============
let dateOfTheWeek = 1
switch dateOfTheWeek {
case 1...5:
    print("工作")
case 6:
    print("玩耍")
case 7:
    print("休息")
default:
    print("数值超限")
}

//============类型转换 Types Conversion===============

let number = 50
let numberToString = String(number)

var day = "5"
let output = "星期 " + day + "，快放假了！"
let newOutput = "星期 \(day)，快放假了！"

//============参数默认值===============

func driveTowards(_ direction: String = "前", for meters: Int) {
    print("向\(direction)走 \(meters) 米")
}

driveTowards(for: 100) //不明确说明，默认往前走
driveTowards("后", for: 100) //明确说明方向，比如向后

//===========返回值============

func rollDice() -> Int {
    Int.random(in: 1...6)
}

print("🎲 骰子投出的点数是 \(rollDice())")


if isArrivedAtHome(distanceToHomeInMeters: 3) {
    print("欢迎回家！")
}

func isArrivedAtHome(distanceToHomeInMeters: Int) -> Bool {
    distanceToHomeInMeters < 5 ? true : false
}

//================数组================

var dailyStepsGoal: Int
var weightRecords: [Double] = [70.4, 70.3, 70.1, 70.0, 69.5]
print(weightRecords)

weightRecords.append(69.3)
print(weightRecords)

weightRecords += [69.1, 69.0]
print(weightRecords)

weightRecords.insert(70.2, at: 2)
print(weightRecords)

weightRecords.removeLast()
weightRecords.remove(at: 7)
print(weightRecords)

weightRecords.removeSubrange(3...6)
print(weightRecords)

let weightOfRandomDay = weightRecords.randomElement()

let indexOf70_2 = weightRecords.firstIndex(of: 70.2)!

weightRecords.sort()
print(weightRecords)

weightRecords.shuffle()
print(weightRecords)

weightRecords = [70.6, 70.5, 71.2, 68.3, 70.9, 69.1]
let targetWeight = 70.0
let diffToTarget = weightRecords.map { ($0 - targetWeight)}

print(diffToTarget)

// 从原体重数组筛选出满足条件的，组成新数组 aboveSeventy
let aboveSeventy = weightRecords.filter { $0 >= 70.0 }

print(aboveSeventy)

// 记录 aboveSeventy 中满足条件的体重所对应的日期，并将数字的日期用字典翻译成中文
var dateOfAboveSeventy: [String] = []
var dateToChar = [1: "一", 2: "二", 3: "三", 4: "四", 5: "五", 6: "六", 7: "天"]

// 使用循环搜索新数组，并将满足条件的日期添加至 dateOfAboveSeventy 中
for searchTarget in aboveSeventy
{
    let date = weightRecords.firstIndex(of: searchTarget)! + 1
    dateOfAboveSeventy.append("星期" + dateToChar[date]!)
}

print(dateOfAboveSeventy)

weightRecords.count
weightRecords.isEmpty
weightRecords.min()
weightRecords.contains(68.3)

let menu = [
    ["面包", "牛奶"],
    ["牛肉面", "茶"],
    ["香蕉", "盖饭", "鸡腿"]
]

print(menu[2][0])

//=============字典===============
var phoneBook = ["老王" : 12345, "老李": 12345]

phoneBook["小吴"] = 22332
print(phoneBook)

phoneBook["小吴"]  = nil
print(phoneBook)

let numberOfWang = phoneBook["老王"]

phoneBook["老王"] = 13579
print(phoneBook)

phoneBook.count
phoneBook.isEmpty
phoneBook.contains(where: { $0.key == "老王" })

let dailyMenu = [
    "早餐": ["面包", "牛奶"],
    "午餐": ["牛肉面", "茶"],
    "晚餐": ["香蕉", "盖饭", "鸡腿"]
]

print(dailyMenu["午餐"]!)

//==========For In 循环=============

func fireABullet() {}

for _ in 1...5 {
    fireABullet()
}

//==========While 循环=============

// 共 3 个生命
var playerLives = 3

while playerLives > 0
{
    // 生成一个随机布尔值
    let isPlayerUnlucky = Bool.random()
    
    if isPlayerUnlucky
    {
        playerLives -= 1
        if playerLives == 0
        {
            print("游戏结束")
        }
    }
}

//==========至少运行一遍的 Repeat While=============

var someCondition = false

repeat
{
    // 无论条件，至少执行一遍此代码
} while someCondition

//==========闭包=============
func isTheFirstsmallerThanSecond(first: Int, second: Int) -> Bool
{
    return first < second
}

let closure = { (first: Int, second: Int) -> Bool in
    return first < second
}

var demoNumbers = [2, 18, 0, -9, 30]

demoNumbers.sort()
print(demoNumbers)

demoNumbers.sort(by: closure)
print(demoNumbers)

demoNumbers.sort(by: { (first: Int, second: Int) -> Bool in
    return first < second
})
print(demoNumbers)

demoNumbers.sort { (first: Int, second: Int) -> Bool in
    return first < second
}
print(demoNumbers)

demoNumbers.sort { (first, second) in
    return first < second
}
print(demoNumbers)

demoNumbers.sort { first, second in first < second }
print(demoNumbers)

// 升序排列
demoNumbers.sort { $0 < $1 }
print(demoNumbers)

// 降序排列
demoNumbers.sort { $0 > $1 }
print(demoNumbers)

//==========可选类型=============

let numberOfWu: Int? = phoneBook["小吴"]

var username: String? = "小王"

print(username!)

if username != nil
{
    let safelyUnwrappedUsername = username!
    print("\(safelyUnwrappedUsername)，想听点什么")
}

if let safelyUnwrappedUsername = username
{
    print("\(safelyUnwrappedUsername)，想听点什么")
}

func guardDemo()
{
    guard let safelyUnwrappedUsername = username
    else
    {
        print("username 的值为 nil")
        return
    }

    print("\(safelyUnwrappedUsername)，想听点什么")
}

guardDemo()

username = "谢佳培"
print("\(username ?? "你好")，想听点什么")

username = nil
print("\(username ?? "你好")，想听点什么")

//==========结构 struct=============

/*
struct Player
{
    // 当前玩家姓名
    var name: String
    
    // 欢迎提示
    func welcomePlayer()
    {
        print("当前游戏账号 \(name)")
    }
}

var playerWang = Player(name: "小王")
playerWang.name
playerWang.welcomePlayer()
*/

struct Player
{
    // 用于存储背包中的物品
    var inventories : [InventoryItem] = []
    
    // 所有玩家
    static var allPlayers: [Player] = []
    
    // 当前玩家姓名
    var name: String
    
    // 当前玩家剩余生命条数
    var livesRemaining = 5
    {
        willSet
        {
            print("警告：还剩下 \(newValue) 条命")
        }
        didSet
        {
            if livesRemaining != 0
            {
                print("已满血复活")
            }
            else
            {
                print("游戏结束")
            }
        }
    }
    
    // 全部生命条数是否耗尽
    var isPlayerOutOfLives: Bool
    {
        get
        {
            livesRemaining == 0 ? true : false
        }
        set
        {
            if newValue
            {
                livesRemaining = 0
            }
        }
    }
    
    // 生命值满值
    let maxHealth = 100
    // 当前生命值
    lazy var currentHealth = maxHealth
    
    // 默认初始化器，有默认值版本
    init(name: String)
    {
        self.name = name
    }
    
    // 默认初始化器，无默认值版本
    init(name: String, livesRemaining: Int, currentHealth: Int)
    {
        self.name = name
        self.livesRemaining = livesRemaining
        self.currentHealth = currentHealth
    }
    
    // 自定义初始化器，初始生命值高
    init(name: String, livesRemaining: Int)
    {
        self.name = "VIP " + name
        self.livesRemaining = livesRemaining
        currentHealth = 10000
    }
    
    // 欢迎提示
    func welcomePlayer()
    {
        print("当前游戏账号 \(name)")
    }
    
    // 玩家被打击而减血
    mutating func damaged(by health: Int)
    {
        currentHealth -= health
        
        // 当前生命值低于 0 时，换用下一条命并重置当前生命值
        if currentHealth < 0 && livesRemaining > 0
        {
            livesRemaining -= 1
            currentHealth = maxHealth
        }
        
        // 生命数量为 0 时，游戏结束
        if livesRemaining == 0
        {
            print("游戏结束")
        }
    }
    
    mutating func stateReport()
    {
        print("当前生命值为 \(currentHealth)，玩家还有 \(livesRemaining) 条命")
    }
    
    // 给出最新添加的玩家实体
    static func recentAddedPlayer() -> Player
    {
        allPlayers[allPlayers.count - 1]
    }
    
    // 支持背包中物品的增加
    mutating func addItem(name : String, description: String, bonusHealth : Int)
    {
        let item = InventoryItem(name: name, description: description, healthBonus: bonusHealth )
        inventories.append(item)
    }
    
    // 每吃一个苹果会补充 50 点当前生命值
    mutating func consumeItem(at index: Int)
    {
        let bonusHealth = currentHealth + self.inventories[index].healthBonus
        currentHealth = (bonusHealth < 100 ? bonusHealth : 100)
        inventories.remove(at: index)
    }
}

// 存储物品
struct InventoryItem
{
    // 存储物品的名称
    var name : String
    
    // 存储物品的描述
    var description : String
    
    // 存储物品补充的血量值
    var healthBonus: Int
}

var playerWang = Player(name: "小王")

var playerXie = Player(name: "小谢", livesRemaining: 6, currentHealth: 100)

var playerLiu = Player(name: "小刘", livesRemaining: 7)

Player.allPlayers.append(playerWang)
Player.allPlayers.append(playerXie)
Player.allPlayers.append(playerLiu)

playerWang.damaged(by: 50)
playerWang.stateReport()

playerWang.damaged(by: 80)
playerWang.stateReport()

playerWang.damaged(by: 30)
playerWang.stateReport()

playerWang.isPlayerOutOfLives = true

playerLiu.stateReport()

print("最新添加的玩家是：\(Player.recentAddedPlayer().name)")

var playerCreator = Player.init(name: "创造者")
playerCreator.addItem(name: "🍎", description: "每吃一个苹果会补充 50 点当前生命值", bonusHealth: 50)
playerCreator.addItem(name: "🍎", description: "每吃一个苹果会补充 50 点当前生命值", bonusHealth: 50)
playerCreator.addItem(name: "🍎", description: "每吃一个苹果会补充 50 点当前生命值", bonusHealth: 50)
playerCreator.damaged(by: 80)
playerCreator.consumeItem(at: 2)
playerCreator.stateReport()

//==============枚举 Enumeration ==============

enum EnergySource
{
    case electricity
    case diesel
    case gasoline
}

print("这辆车的动力类型是：\(EnergySource.electricity)")

// 汽车能源类型
var selectedVehicleEnergy = EnergySource.electricity

// 政策说明
var policyNote: String?

switch selectedVehicleEnergy
{
case .electricity:
    policyNote = "电动车：国家补贴 5000 元人民币，鼓励购买。"
case .diesel:
    policyNote = "柴油车：需额外缴纳 200 元人民币作为排放处理费。"
case .gasoline:
    policyNote = "汽油车：无特殊政策说明。"
}

print(policyNote ?? "暂无说明")

policyNote = nil
policyNote = Optional.none // 等同于 nil

//===============类 Class==============

class Car
{
    var brand: String
    var year: String
    var energy: EnergySource
    
    init(brand: String, year: String, energy: EnergySource)
    {
        self.brand = brand
        self.year = year
        self.energy = energy
    }
}

// 轿车
class Sedan : Car
{
    // 是否支持自动驾驶
    var assistantEquipped: Bool
    
    override init(brand: String, year: String, energy: EnergySource)
    {
        assistantEquipped = false
        
        // 将子类属性初始化完成后才能初始化父类属性，否则会报错
        super.init(brand: brand, year: year, energy: energy)
    }
    
    // 升级为自动驾驶
    func upgradeAssistant()
    {
        assistantEquipped = true
    }
}

// 卡车
class Truck: Car
{
    
}

let teslaModel3 = Sedan(brand: "Tesla", year: "2017", energy: .electricity)

let toyotaHilux = Truck(brand: "Toyota", year: "1968", energy: .gasoline)

// 创建数组 cars，用来存放 Sedan 与 Truck 的实体
let cars = [teslaModel3, toyotaHilux]

// 本来是teslaModel3，结果转变成了Car的实体
let firstCarInCars = cars[0]

// 统计数组 cars 中的轿车个数
var sedanCount = 0
for car in cars
{
    if car is Sedan
    {
        sedanCount += 1
    }
}
print("cars 中有 \(sedanCount) 辆轿车")

// 将数组 cars 中所有的轿车都升级自动驾驶
for car in cars
{
    if let teslaModel3 = car as? Sedan
    {
        teslaModel3.upgradeAssistant()
    }
}

extension Car
{
    // 添加 Computed Property
    var quickInfo: String
    {
        "The car brand is \(brand), first built on \(year)"
    }
}

print("\(teslaModel3.quickInfo)")

//===============别名 typealias===========

typealias Age = Int
let ageVersionOne: Int = 50
let ageVersionTwo: Age = 50

typealias PhoneBook = [String: Int]
let phoneBookVersionOne: [String: Int] = ["小王": 12345]
let phoneBookVersionTwo: PhoneBook = ["小王": 12345]

struct Company { }
typealias InternetCompany = Company
let companyVersionOne: Company = Company()
let companyVersionTwo: InternetCompany = Company()

//================协议 Protocol=============

// 描述性的 protocol
protocol Expressible
{
    var name: String { get }
    
    init(name: String)
}

// 用户 struct
struct User
{
    var name: String
}

// 用户 User 遵守协议 Expressible
extension User: Expressible { }

// 创建两个整数
let numberOne = 10
let numberTwo = 20

// 判断其是否相等
if numberOne == numberTwo
{
    print("两个数相等")
}

// 自定义类型提醒事项 Todo
struct Todo: Equatable, Identifiable, Codable
{
    var content: String
    
    var id = UUID()
    
    /*
    static func ==(lhs: Todo, rhs: Todo) -> Bool
    {
        return lhs.content == rhs.content
    }
    */
}

// 创建两个提醒事项
// 写法 1
let todoOne = Todo(content: "玩游戏")
/* 写法 2
 {
    "content": "玩游戏",
    "id": "27451423-765D-4942-873D-5AF52DF955E4"
 }
*/
let todoTwo = Todo(content: "写文章")

// 判断其是否相同
if todoOne == todoTwo
{
    print("两个提醒事项完全相同")
}

// 一年中的某一天
struct DateOfTheYear
{
    let year: Int
    let month: Int
    let day: Int
}

// 满足可比性
extension DateOfTheYear: Comparable
{
    static func < (lhs: DateOfTheYear, rhs: DateOfTheYear) -> Bool
    {
        if lhs.year != rhs.year
        {
            return lhs.year < rhs.year
        }
        else if lhs.month != rhs.month
        {
            return lhs.month < rhs.month
        }
        else
        {
            return lhs.day < rhs.day
        }
    }
}

let dayOne = DateOfTheYear(year: 2020, month: 6, day: 17)
let dayTwo = DateOfTheYear(year: 2020, month: 6, day: 18)

if dayOne < dayTwo
{
    print("日期 1 小于日期 2")
}
else if dayOne > dayTwo
{
    print("日期 1 大于日期 2")
}
else
{
    print("日期相等")
}

// 满足可哈希性
extension DateOfTheYear: Hashable { }

let todos = [dayOne: todoOne, dayTwo: todoTwo]

// 可辨识性 Identifiable
print("\(todoOne.id)")

//===========异常处理===============

// fatalError()

// 创建密码错误
enum PasswordError: Error
{
    case notLongEnough
}

// 验证新建密码是否满足长度要求
func validatePassword(_ password: String) throws -> Bool
{
    if password.count < 6
    {
        throw PasswordError.notLongEnough
    }
    return true
}

var password = "6419012"

// do-try-catch 写法，密码 64190 的运行结果是「密码需要至少 6 位数」
do
{
    try validatePassword(password)
    print("密码有效")
}
catch PasswordError.notLongEnough
{
    print("密码需要至少 6 位数")
}

// try? 写法，密码 6419091 的运行结果是「验证结果是 true，密码有效」
if let validateResult = try? validatePassword(password)
{
    print("验证结果是 \(validateResult)，密码有效")
}
else
{
    print("密码需要至少 6 位数")
}

// try! 写法，运行函数，但彻底忽视错误
try! validatePassword(password)
