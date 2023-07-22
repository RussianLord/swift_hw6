/*
Создать структуру работника пиццерии. В ней должны быть такие свойства, как имя, зарплата и должность.
Должностей пока может быть две: или кассир, или повар.
Добавить в класс пиццерии массив с работниками.

Создать класс столика. В нём должны быть свойство, в котором содержится количество мест, и функция, 
которая на вход принимает количество гостей, которое хотят посадить, возвращает true, если места хватает,
 и false, если места не хватает. Изначальное количество мест задаётся в инициализаторе.
Добавить в класс пиццерии свойство, в котором хранится массив столиков. У класса столика добавить свойство,
 в котором хранится кафе, в котором стоит столик. Столики создаются сразу в инициализаторе, не передаются туда в качестве параметра.
*/

struct stuff{
    enum position:String{
        case cassir = "Кассир"
        case chef = "Повар"
    }
    var nameStuff: String
    var salary: Double
    var positionStuff: position
}

class table{
    init(size: Int, cafe: Cafe){
        self.cafe = cafe
        self.size = size
    }
    func guest(numberGhuests: Int) -> Bool{
        if(size < numberGhuests){
            return false
        }
        return true
    }
}



class pizzeria{
    private var order:[OrderProtocol]
    init(order:[OrderProtocol], stuff:[stuff], table:[table]){
        self.order = order
        self.stuff = stuff
        self.table = table
    }
    func add(new: OrderProtocol){
        self.order.append(new)
    }
    func get(){
        for i in order{
            print(i)
        }
    }
}

struct pizza:OrderProtocol{
    enum pizzaType{
        case classic
        case fatPizza
        case vegetable
    }

    enum additions{
        case tomatoes
        case pepperoni
        case cheese
    }
    var type:pizzaType
    var add:additions
    var cost:Double
    var fat:Bool

    init(type: pizzaType, add: additions, cost:Double,fat:Bool){
        self.type = type
        self.add = add
        self.cost = cost
        self.fat = fat
    }
}

struct potatoe: OrderProtocol{
    enum sizePotatoe{
        case s
        case m
        case l
    }
    var cost:Double
    var size:sizePotatoe

    init(cost: Double, size:sizePotatoe){
        self.cost = cost
        self.size = size
    }
}

protocol OrderProtocol{
    var cost: Double{get}
}

let ord = pizzeria(order:[]) 
let mediumPotatoe = potatoe(cost:55,size:potatoe.sizePotatoe.s)
let justPizza = pizza(type:pizza.pizzaType.classic,add: pizza.additions.cheese,cost: 125.5,fat: true)
ord.add(new:justPizza)
ord.add(new:mediumPotatoe)

extension pizzeria{
    protocol OpenClose{
    var status:Bool = false
    func open(){
        if(status){
            print("Кафе уже открыто")
        }
        else{
            status = true
            print("Кафе открыто")
        }
    }
    func close(){
        if(!status){
            print("Кафе уже закрыто")
        }
        else{
            status = false
            print("Кафе закрыто")
        }
    }
}
}

func minus<T: Numeric>(a:T,b:T)-> T{
    a-b
}
