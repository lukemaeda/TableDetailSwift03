//
//  TableViewController.swift
//  TableDetailSwift01
//
//  Created by MAEDAHAJIME on 2015/07/08.
//  Copyright (c) 2015年 MAEDA HAJIME. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    // Plist用の配列
    var _items:NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Plistファイルパス
        let path = NSBundle.mainBundle().pathForResource("Items3", ofType:"plist")
        _items = NSArray(contentsOfFile:path!)!
        
        //println(_items);

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    // 設定（列）
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    // 設定（行数）
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return _items.count
    }

    // 設定（セル）
    override func tableView(tableView: UITableView, cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {

        // Get a Cell
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        let dic = _items.objectAtIndex(indexPath.row) as! NSDictionary
        cell.textLabel!.text = dic.valueForKey("Name") as? String
        cell.detailTextLabel!.text = dic.valueForKey("Note") as? String
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // 画面遷移時に値を遷移先に渡す
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // セグエ判定
        if (segue.identifier == "Segue01"){
            
            // セルの情報の取得
            var indexPath:NSIndexPath = self.tableView.indexPathForSelectedRow()!
            // row 行数の抜き出し
            var row:NSInteger = indexPath.row
            
            // DetailViewControllerクラスをインスタンス化してsegue（画面遷移）で値を渡せるようにバンドルする
            let detailView : DetailViewController = segue.destinationViewController as! DetailViewController
            // detailView（バンドルされた変数）に受け取り用の変数を引数としrowを渡す（rowには渡したい値）
            // この時DetailViewControllerにて受け取る同型の変数を用意しておかないとエラーになる
            detailView.row =  row as Int
            //println(" \(detailView.row)")
        }
    }
}
