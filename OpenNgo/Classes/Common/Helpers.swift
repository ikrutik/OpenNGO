//
//  Helpers.swift
//  OpenNgo
//
//  Created by Sergey Krutikov on 11.03.2018.
//  Copyright © 2018 Sergey Krutikov. All rights reserved.
//

import Foundation
import UIKit

extension Double {
    public func toCurrencyFormatString() -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = .current
        currencyFormatter.currencyGroupingSeparator = " "
        currencyFormatter.currencySymbol = "₽ "
        currencyFormatter.roundingMode = .up
        currencyFormatter.roundingIncrement = 1
        currencyFormatter.minimumFractionDigits = 0
        return currencyFormatter.string(from: NSNumber(value: self))!
    }
}

extension UIStoryboard {
    func instantiateVC<T: UIViewController>() -> T? {
        if let name = NSStringFromClass(T.self).components(separatedBy: ".").last {
            return instantiateViewController(withIdentifier: name) as? T
        }
        return nil
    }
    
    func instantiateVC<T: UIViewController>(with identifier: String) -> T? {
        return instantiateViewController(withIdentifier: identifier) as? T
    }
}

extension UITableView {
    
    func setEmptyMessage(message: String) {
        let messageLabel = UILabel(
            frame: CGRect(
                x: 0, y: 0,
                width: self.bounds.size.width,
                height: self.bounds.size.height
            ))
    
        messageLabel.text = message
        messageLabel.textColor = UIColor.black
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()
        
        self.separatorStyle = .none
        self.backgroundColor = UIColor.cyan
        self.backgroundView = messageLabel
    }
}

protocol CellInterface {
    static var id: String { get }
    static var cellNib: UINib { get }
}

extension CellInterface {
    
    static var id: String {
        return String(describing: Self.self)
    }
    
    static var cellNib: UINib {
        return UINib(nibName: id, bundle: nil)
    }
    
}

public protocol DequeuableProtocol: class {
    
    //Возвращает имя nib-а, в котором находится ресурс.
    //Вы должны реализовать его, если ваша ячейка находится в отдельном Xib-файле.
    //Нельзя использовать в Storyboard, иначе придется использовать table.register(CellClass.self) перед использованием в коде
    //Реализация по умолчанию возвращает имя самого класса.
    static var dequeueNibName: String { get }
    
    //Это идентификатор, используемый в queue/dequeue ячейки.
    //Вам не нужно переопределять его. Реализация по умолчанию возвращает имя класса ячейки, как идентификатор.
    static var dequeueIdentifier: String { get }
}

extension DequeuableProtocol where Self: UIView {
    public static var dequeueIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    public static var dequeueNibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

public extension UITableView {
    /// Зарегистрируйте ячейку из внешнего xib в экземпляр таблицы.
    ///
    /// - Parameter _: cell class
    public func register<T: UITableViewCell>(_: T.Type) where T: DequeuableProtocol {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.dequeueNibName, bundle: bundle)
        self.register(nib, forCellReuseIdentifier: T.dequeueIdentifier)
    }
    
    /// Зарегистрируйте header из внешнего xib в экземпляр таблицы.
    ///
    /// - Parameter _: headerOrFooter class
    public func register<T: UITableViewHeaderFooterView>(_: T.Type) where T: DequeuableProtocol {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.dequeueNibName, bundle: bundle)
        self.register(nib, forHeaderFooterViewReuseIdentifier: T.dequeueIdentifier)
    }
    
    /// Извлеките экземпляр ячейки, который строго типизирован.
    ///
    /// - Parameter indexPath: index path
    /// - Returns: instance
    public func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: DequeuableProtocol {
        guard let cell = dequeueReusableCell(withIdentifier: T.dequeueIdentifier, for: indexPath) as? T else {
            fatalError("Cannot dequeue: \(T.self) with identifier: \(T.dequeueIdentifier)")
        }
        return cell
    }
    
    /// Извлеките экземпляр ячейки, который строго типизирован.
    ///
    /// - Returns: instance
    public func dequeueReusableCell<T: UITableViewCell>() -> T where T: DequeuableProtocol {
        guard let cell = dequeueReusableCell(withIdentifier: T.dequeueIdentifier)  as? T else {
            fatalError("Cannot dequeue: \(T.self) with identifier: \(T.dequeueIdentifier)")
        }
        return cell
    }
    
    /// Извлеките экземпляр header cell.
    ///
    /// - Returns: instance
    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T where T: DequeuableProtocol {
        guard let cell = dequeueReusableHeaderFooterView(withIdentifier: T.dequeueIdentifier)  as? T else {
            fatalError("Cannot dequeue: \(T.self) with identifier: \(T.dequeueIdentifier)")
        }
        return cell
    }
}

public extension UICollectionView {
    public func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: DequeuableProtocol {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.dequeueIdentifier, for: indexPath) as? T else {
            fatalError("Cannot dequeue: \(T.self) with identifier: \(T.dequeueIdentifier)")
        }
        return cell
    }
}

