//
//  MediatorC.swift
//  DesignPartten
//
//  Created by IOS3 on 2020/3/23.
//  Copyright © 2020 fyu. All rights reserved.
//
/*
 💐 中介者（Mediator）
 用一个中介者对象封装一系列的对象交互，中介者使各对象不需要显示地相互作用，从而使耦合松散，而且可以独立地改变它们之间的交互。
 */
import UIKit

class MediatorC: TestBaseC {

    override func viewDidLoad() {
        super.viewDidLoad()

        func spamMonster(message: String, worker: MessageMediator) {
            worker.send(message: message)
        }

        let messagesMediator = MessageMediator()

        let user0 = Programmer(name: "Linus Torvalds")
        let user1 = Programmer(name: "Avadis 'Avie' Tevanian")
        messagesMediator.add(recipient: user0)
        messagesMediator.add(recipient: user1)

        spamMonster(message: "I'd Like to Add you to My Professional Network", worker: messagesMediator)
    }
    

}


fileprivate protocol Receiver {
    associatedtype MessageType
    func receive(message: MessageType)
}

fileprivate protocol Sender {
    associatedtype MessageType
    associatedtype ReceiverType: Receiver
    
    var recipients: [ReceiverType] { get }
    
    func send(message: MessageType)
}

fileprivate struct Programmer: Receiver {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func receive(message: String) {
        print("\(name) received: \(message)")
    }
}

fileprivate final class MessageMediator: Sender {
    internal var recipients: [Programmer] = []
    
    func add(recipient: Programmer) {
        recipients.append(recipient)
    }
    
    func send(message: String) {
        for recipient in recipients {
            recipient.receive(message: message)
        }
    }
}
