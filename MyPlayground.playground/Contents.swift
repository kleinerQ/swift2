//: Playground - noun: a place where people can play

import UIKit




//let str = "ABCDEF    \n \n"
//let str2 = "Hello, playground"
//let arr = Array(str2)
//print(arr[5])
////print(str2[2]) // not allowed
//str2[.init(encodedOffset: 7)]
//str2[str2.index(str.startIndex, offsetBy: 5)]
//
//str2.prefix(5)
//str2.suffix(5)
//let begin = str2.index(of: "p")
//let end = str2.index(begin!, offsetBy:4)
//let newStr = String(str2[begin!..<end])
//if(str2.contains("pl")){
//    print("AA")
//}
//let tmp = str2.replacingOccurrences(of: "play", with: "Haloo")
//
//
//if(str2.hasPrefix("He")){
//    print("The string start from He")
//}
//
//if(str2.hasSuffix("ound")){
//    print("The string end for ound")
//}
//
//let s = "wang, Lily Braun weg,0931-1212123"
//let list = s.split(separator: ",")
//var arr3 = [3,5,1,8,2]
//arr3.sorted();
//arr3
//
//arr3.sorted(by: >)
//
//let x = arr3.reversed()
//x.forEach{(element) in
//    print(element)
//}
//
////索引值1 3 互換
//arr3.swapAt(1, 3)
//
//arr3.first
//arr3.last
//arr3.count
//arr3[1]

//str.count;
//
//let indexStart = str.index(of:"C")
//let indexEnd = str.index(of:"E")
//var subStr = str[indexStart!..<indexEnd!]
//
//print(subStr)
//
//var tmp=str.trimmingCharacters(in: .whitespacesAndNewlines)
//
//
//tmp.lowercased()
//
//tmp.uppercased()
//
//for i in 1...10 where i % 2 == 1{
//    print(i)
//}
//
//let cityArray=["台北","台中","高雄"]
//for city in cityArray{
//    print(city)
//}

//for i in (0 ..< 10).reversed() {
//
//    print(i)
//}
//
//
//
//for index in stride(from: 5, to: 1, by: -1) {
//    print(index)
//}
////prints 5, 4, 3, 2
//
//for index in stride(from: 5, through: 1, by: -1) {
//    print(index)
//}
////prints 5, 4, 3, 2, 1


//
//
//var n=0
//while n<10{
//
//    print(n)
//    n+=2
//}



//
//var n2=0
//repeat {
//
//    print(n2)
//    n2+=2
//}while n2<10
//
//let arr=Array(repeating: "a", count: 20)
//for element in arr{
//    print(element)
//}
//
//let arr2=Array(repeating: Array(repeating: 0, count: 8), count: 3)
//for element in arr2{
//    print(element)
//}
//
//
//var name = ["andy", "Mary","Tom"]
//name.append("Don")
//name.insert("Jolin", at: 2)
//
//
//var arr3 = [5,7,2,4]
//arr3 = [5,2,31]
//arr3.sorted().forEach { (n) in
//
//    print(n)
//
//}
//
//for n in arr3.sorted(){
//
//    print(n)
//}
//
//let arr4=arr3.sorted();
//for idx in 0 ..< arr4.count{
//    print(arr4[idx])
//}
//
//var color: [UIColor:String] = [:]
//color[UIColor.black] = "黑色"
//color[UIColor.yellow] = "黃色"
//color[UIColor.red] = "紅色"
//print(color[UIColor.red]!)
//
//var age=["F":30, "B":40, "C":50]
//
//let tmp2 = age.sorted{ (d1, d2) -> Bool in
//
//
//    return d1.key < d2.key
//
//
//}
//
//print(tmp2)
//
//let a=10;
//let b=2;
//
//if a==10,b==20{
//    print("AAA")
//
//}else{
//
//    print("BBB")
//
//}




//var aa = "10"
//var nn : Int!
//nn=Int(aa)
//print(nn * 10)

//var arr = [String]()
//arr.append("A")
//arr.append("C")
//arr.append("D")

//var arr : [[String:String]] = []
//arr.append(["姓名":"王大明","地址":"文心路一號","電話":"0421111"])
//arr.append(["姓名":"李大媽","地址":"文心路二號","電話":"0431111"])
//arr.append(["姓名":"王小明","地址":"文心路三號","電話":"0441111"])
//
////print(arr[1]["地址"])
//arr.forEach{(element) in
////    if(element["姓名"]=="李大媽"){
////        print(element["姓名"])
////    }
//    if(element["姓名"] == "李大媽"){
//        print(element["地址"]!)
//    return
//    }
//
////    element.forEach{ (x) in
////        if(x.value == "李大媽"){
////            element["地址"]
//////        print(value)
////
////        }
////    }
//
//
//}
//
//for data in arr{
//    if data["姓名"]=="李大媽"{
//
//        print(data["地址"])
//    }
//}
//
//
//
//var t:(y:Int, x:Int)=(y:20, x:10)  //tuple
//
//print(t.0)
//print(t.1)
//
////print(t)
//
//t.0=30
//print(t.0)
//print(t.x)
//
//var a = 10
//var b = 20
//
//
//print("a=\(a) , b=\(b)")
//(a,b)=(b,a)
//print("a=\(a) , b=\(b)")


//func myPring(外部看的到 內部使用的:String){
//    print(內部使用的)
//    print(內部使用的)
//    print(內部使用的)
//}
//myPring(外部看的到: "hello")
//
//
////名字是：addTwoValuesAndPrint(x:y:)
//func addTwoValuesAndPrint(x v1:Int, y v2:Int){
//    print(v1+v2)
//
//}
//addTwoValuesAndPrint(x: 2, y: 3)
//
//
//
////名字是addTwoValuesWith(firstValue:andSecondValue:)
//func addTwoValuesWith(firstValue x: Int, andSecondValue y: Int){
//    print(x+y)
//}
//addTwoValuesWith(firstValue: 10, andSecondValue: 20)
//
//
////normal declaration_1 外部名稱想省略
//func addTwoValues(_ x:Int,_ y:Int){
//    print(x+y)
//}
//
//addTwoValues(2, 9)
//
//
////normal declaration_2, 內部與外部名稱一樣
//func addTwoValue1(x: Int,y: Int){
//    print(x+y)
//}
//addTwoValue1(x:10,y:3)
//
//
////return
//func addTwoValues3(x: Int,y:Int) -> Int{
//
//    return x + y
//}
//let ans = addTwoValues3(x: 10, y: 9)
//
//
//
////return with nil
//func divide(x: Float, y: Float)->Float?{
//    guard y != 0 else {
//        return nil
//    }
//    return x / y
//}
//
//if let ans = divide(x: 5, y: 0){
//    print("答案為： ）\(ans)")
//}else{
//    print("運算錯誤，建議檢查分母是否為零")
//
//}
//
//
////參數預設值
//func myPower(value: Decimal, power: Int = 2) ->Decimal{
//
//    return pow(value, power)
//}
//
//myPower(value: 10)
//myPower(value: 10, power: 10)
//
//
////動態參數數量
//func mySum(_ arr: Int...) -> Int{
//    var sum = 0
//    for n in arr{
//        sum += n
//    }
//    return sum
//}
//
//mySum(2,5,19,1,20)
//
//mySum(2,5,19,1,20,30)
//mySum(2,5,19,1,20,30,100)


//var a = 10;
//var b = 20;
//
////  call by address
//func mySwap(x: inout Int, y: inout Int){
//    let tmp = x
//    x = y
//    y = tmp
//}
//
//mySwap(x: &a, y: &b)
//print("a=\(a) , b=\(b)")

class Peolpe {
    private var hairColor = "black"
    
    func adder(_ 輸入1: Int,_ 輸入2: Int) -> Int {
        return (輸入1+輸入2)
    }
    
}

class NewPeople: Peolpe{
    
}

let wang = NewPeople()
//print wang.adder(3, 5)


print("a")


