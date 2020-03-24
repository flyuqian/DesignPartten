//
//  ViewController.swift
//  DesignPartten
//
//  Created by IOS3 on 2020/3/23.
//  Copyright © 2020 fyu. All rights reserved.
//
// copy frome
// https://github.com/Binlogo/Design-Patterns-In-Swift-CN#-%E5%8D%95%E4%BE%8Bsingleton
//



import UIKit

class ViewController: UIViewController {
    
    let datas: [[TestClassInfo]] = [
        [
            TestClassInfo(title: "责任链", subTitle: "Chain Of Responsibility", clzz: ChainOfResPonsibilityC.self),
            TestClassInfo(title: "命令", subTitle: "Command", clzz: CommandC.self),
            TestClassInfo(title: "解释器", subTitle: "Interpreter", clzz: InterpreterC.self),
            TestClassInfo(title: "迭代器", subTitle: "Ieterator", clzz: IteratorC.self),
            TestClassInfo(title: "中介者", subTitle: "Mediator", clzz: MediatorC.self),
            TestClassInfo(title: "备忘录", subTitle: "Memento", clzz: MementoC.self),
            TestClassInfo(title: "观察者", subTitle: "Observer", clzz: ObserverC.self),
            TestClassInfo(title: "状态", subTitle: "State", clzz: StateC.self),
            TestClassInfo(title: "策略", subTitle: "Stategy", clzz: StrategyC.self),
            TestClassInfo(title: "访问者", subTitle: "Visitor", clzz: VisitorC.self),
        ],
        [
            TestClassInfo(title: "抽象工厂", subTitle: "AbstractFactory", clzz: AbstractFactoryC.self),
            TestClassInfo(title: "生成器", subTitle: "Builder", clzz: BuilderC.self),
            TestClassInfo(title: "工厂方法", subTitle: "Factory Method", clzz: FactoryMethodC.self),
            TestClassInfo(title: "原型", subTitle: "Prototype", clzz: PrototypeC.self),
            TestClassInfo(title: "单例", subTitle: "SingleLeton", clzz: SingleletonC.self),
        ],
        [
            TestClassInfo(title: "适配器", subTitle: "Adapter", clzz: AdapterC.self),
            TestClassInfo(title: "桥接", subTitle: "Bridge", clzz: BridgeC.self),
            TestClassInfo(title: "组合", subTitle: "Composite", clzz: CompositeC.self),
            TestClassInfo(title: "修饰", subTitle: "Decorator", clzz: DecoratorC.self),
            TestClassInfo(title: "外观", subTitle: "Facade", clzz: FacadeC.self),
            TestClassInfo(title: "享元", subTitle: "Flyweight", clzz: FlyweightC.self),
            TestClassInfo(title: "代理保护", subTitle: "Protection Proxy", clzz: ProtectionProxyC.self),
            TestClassInfo(title: "虚拟代理", subTitle: "Virtual Proxy", clzz: VirtualProxyC.self),
        ]
    ]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return datas.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "行为型模式"
        case 1: return "创建型模式"
        case 2: return "结构型模式"
        default: return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = (tableView.dequeueReusableCell(withIdentifier: "HomeCellID")) ?? UITableViewCell(style: .subtitle, reuseIdentifier: "HomeCellID")
        let info = datas[indexPath.section][indexPath.row]
        cell.textLabel?.text = info.title
        cell.detailTextLabel?.text = info.subTitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let info = datas[indexPath.section][indexPath.row]
        let c = info.clzz.init()
        c.title = info.title
        self.navigationController?.pushViewController(c, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44 * 1.5
    }
}

struct TestClassInfo {
    let title: String
    let subTitle: String
    let clzz: UIViewController.Type
}
