//
//  DetailViewController.swift
//  TableDetailSwift02
//
//  Created by MAEDAHAJIME on 2015/07/08.
//  Copyright (c) 2015年 MAEDA HAJIME. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // Plist用の配列
    var _items:NSArray = []

    /// 遷移時の受け取り用の変数
    var row:Int = 0
    
    @IBOutlet weak var lbMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Plistファイルパス
        let path = NSBundle.mainBundle().pathForResource("Items3", ofType:"plist")
        _items = NSArray(contentsOfFile:path!)!

        //println(" \(row)")
        
        // タイトルの表示
        self.lbMessage!.text = _items.objectAtIndex(row).valueForKey("Name") as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
