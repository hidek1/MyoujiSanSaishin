//
//  PrefViewController.swift
//  名字さん
//
//  Created by 吉永秀和 on 2018/07/19.
//  Copyright © 2018年 吉永秀和. All rights reserved.
//

import UIKit

class PrefViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var pref:String = ""
    var ranking:[(key:String, value: Int)] = []
    
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var prefLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
        print(pref)
        prefLabel.text = pref
        // background image
        let bg = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        bg.image = UIImage(named: "sky.png")
        bg.layer.zPosition = -1
        bg.backgroundColor = UIColor.white
        self.view.addSubview(bg)
        TableView.backgroundColor = .clear
        let date:Date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy年MM月"
        let tDate = format.string(from: date)
        dayLabel.text = tDate
        print(ranking)

        // Do any additional setup after loading the view.
    }


    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ranking.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        // セルに表示する値を設定する
        let rankname = self.ranking.map{ $0.key}
        print(rankname)
        let rankscore = self.ranking.map{ $0.value}
        print(rankscore)
        
        let textAttributes1: [NSAttributedStringKey : Any] = [
            .font : UIFont(name: "takumi-yutorifont-P", size: 23),
            .foregroundColor : UIColor(red: 255/255, green: 215/255, blue: 0, alpha: 1.0),
            .strokeColor : UIColor.black,
            .strokeWidth : -1.0
        ]
        let text11 = NSAttributedString(string: "\(indexPath.row + 1)  \(rankname[indexPath.row])さん", attributes: textAttributes1)
        let text12 = NSAttributedString(string: "\(rankscore[indexPath.row])pt", attributes: textAttributes1)
        
        let textAttributes2: [NSAttributedStringKey : Any] = [
            .font : UIFont(name: "takumi-yutorifont-P", size: 23),
            .foregroundColor : UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1),
            .strokeColor : UIColor.black,
            .strokeWidth : -1.0
        ]
        let text21 = NSAttributedString(string: "\(indexPath.row + 1)  \(rankname[indexPath.row])さん", attributes: textAttributes2)
        let text22 = NSAttributedString(string: "\(rankscore[indexPath.row])pt", attributes: textAttributes2)
        
        let textAttributes3: [NSAttributedStringKey : Any] = [
            .font : UIFont(name: "takumi-yutorifont-P", size: 23),
            .foregroundColor : UIColor(red: 196/255, green: 112/255, blue: 34/255, alpha: 1),
            .strokeColor : UIColor.black,
            .strokeWidth : -1.0
        ]
        let text31 = NSAttributedString(string: "\(indexPath.row + 1)  \(rankname[indexPath.row])さん", attributes: textAttributes3)
        let text32 = NSAttributedString(string: "\(rankscore[indexPath.row])pt", attributes: textAttributes3)
        
        cell.textLabel!.text = "\(indexPath.row + 1)  \(rankname[indexPath.row])さん"
        cell.detailTextLabel?.text = "\(rankscore[indexPath.row])pt"
        cell.detailTextLabel?.textColor = UIColor.black
        if indexPath.row == 0 {
            cell.textLabel!.attributedText = text11
            cell.detailTextLabel?.attributedText = text12
        }
        if indexPath.row == 1 {
            cell.textLabel!.attributedText = text21
            cell.detailTextLabel?.attributedText = text22
        }
        if indexPath.row == 2 {
            cell.textLabel!.attributedText = text31
            cell.detailTextLabel?.attributedText = text32
        }
        cell.textLabel!.font = UIFont(name: "takumi-yutorifont-P", size: 21)
        cell.detailTextLabel?.font = UIFont(name: "takumi-yutorifont-P", size: 21)
        cell.backgroundColor = .clear
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ScreenShot(_ sender: Any) {
        //コンテキスト開始
        UIGraphicsBeginImageContextWithOptions(UIScreen.main.bounds.size, false, 0.0)
        //viewを書き出す
        self.view.drawHierarchy(in: self.view.bounds, afterScreenUpdates: true)
        // imageにコンテキストの内容を書き出す
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        //コンテキストを閉じる
        UIGraphicsEndImageContext()
        // imageをカメラロールに保存
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
