//
//  ViewController.swift
//  MethodCollection
//
//  Created by 无双 on 2022/3/26.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate var kNavigationHeight: CGFloat    = UIApplication.shared.statusBarFrame.size.height + 44.0
    
    struct PageConstructor {
        var title: String
        var page: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "实用方法收集"
        view.backgroundColor = .white
        
        view.addSubview(tablView)
    }
    
    fileprivate var dataSource = [
        PageConstructor(title: "事件传递", page: "PassEventsViewController")
    ]
    
    lazy var tablView: UITableView = {
        let tab = UITableView(frame: CGRect(x: 0, y: kNavigationHeight, width: self.view.frame.size.width, height: self.view.frame.size.height - kNavigationHeight), style: .plain)
        tab.showsHorizontalScrollIndicator = false
        tab.showsVerticalScrollIndicator = false
        if #available(iOS 15, *) {
            tab.sectionHeaderTopPadding = 0
        }
        tab.estimatedRowHeight = 0
        tab.estimatedSectionHeaderHeight = 0
        tab.estimatedSectionFooterHeight = 0
        if #available(iOS 11.0, *) {
            tab.contentInsetAdjustmentBehavior = .never
        } else { }
        
        tab.delegate = self
        tab.dataSource = self
        tab.separatorInset = .zero
        
        return tab
    }()
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "CellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            cell?.accessoryType = .disclosureIndicator
        }
        cell?.textLabel?.text = dataSource[indexPath.row].title
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vcStr = dataSource[indexPath.row].page
        guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
            return
        }
        if let stringCls = clsName as? String {
            let newCls = stringCls.replacingOccurrences(of: " ", with: "_")
            let cls: AnyClass? = NSClassFromString(newCls + "." + vcStr)
            guard let vcClass = cls as? UIViewController.Type else {
                print("无法转换成 UIViewController")
                return
            }
            let vc = vcClass.init()
            
            vc.view.backgroundColor = .white
            vc.title = dataSource[indexPath.row].title
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
}
