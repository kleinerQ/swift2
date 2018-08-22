//: Playground - noun: a place where people can play

import UIKit

func test(){
    let q = DispatchQueue.global()
    q.async {
        sleep(3)
        print("Func Done")
    }
    
}

print("1")
test()
print("2")
