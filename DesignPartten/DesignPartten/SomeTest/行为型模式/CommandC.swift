//
//  CommandC.swift
//  DesignPartten
//
//  Created by IOS3 on 2020/3/23.
//  Copyright © 2020 fyu. All rights reserved.
/*
 命令模式是一种设计模式，它尝试以对象来代表实际行动。命令对象可以把行动(action) 及其参数封装起来，于是这些行动可以被：

 重复多次
 取消（如果该对象有实现的话）
 取消后又再重做
 */

import UIKit

class CommandC: TestBaseC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let podBayDoors = "Pod Bay Doors"
        let doorModule = HAL9000DoorsOperations(doors:podBayDoors)

        doorModule.open()
        doorModule.close()
    }
}


fileprivate protocol DoorCommand {
    func execute() -> String
}

fileprivate final class OpenCommand: DoorCommand {
    let doors:String

    required init(doors: String) {
        self.doors = doors
    }
    
    func execute() -> String {
        return "Opened \(doors)"
    }
}

fileprivate final class CloseCommand: DoorCommand {
    let doors:String

    required init(doors: String) {
        self.doors = doors
    }
    
    func execute() -> String {
        return "Closed \(doors)"
    }
}

fileprivate final class HAL9000DoorsOperations {
    let openCommand: DoorCommand
    let closeCommand: DoorCommand
    
    init(doors: String) {
        self.openCommand = OpenCommand(doors:doors)
        self.closeCommand = CloseCommand(doors:doors)
    }
    
    func close() -> String {
        return closeCommand.execute()
    }
    
    func open() -> String {
        return openCommand.execute()
    }
}
