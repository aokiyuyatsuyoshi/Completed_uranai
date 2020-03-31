
import UIKit
import Alamofire
import SwiftyJSON

class resultViewController: UIViewController {

    @IBOutlet weak var rank_printed: UILabel!
    @IBOutlet weak var sign_printed: UILabel!
    @IBOutlet weak var content_printed: UILabel!
    @IBOutlet weak var luckyitem_printed: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.get_uranai()
    }
     var pre_flag = 0
    
    func get_uranai(){
        //https://qiita.com/rinov/items/bff12e9ea1251e895306参考
        let nowtime = Date()
        let dateformat = DateFormatter()
        dateformat.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy/MM/dd", options: 0, locale: Locale(identifier: "ja_JP"))
        let nowtime_is = dateformat.string(from: nowtime)
        let nowURL = "http://api.jugemkey.jp/api/horoscope/free/"+nowtime_is
        
  AF.request(nowURL).responseJSON
    { response in
    switch response.result{
        case .success(let value):
            
        //jsonを取得
        let get_json = JSON(value)
        //星座選択まで
        let result = get_json["horoscope"][nowtime_is][self.pre_flag]
        //順位を取得
        let rank = result["rank"].stringValue
        self.rank_printed.text = rank + "位"
        //星座を取得
        let sign = result["sign"].stringValue
        self.sign_printed.text = sign
        //本文を取得
        let content = result["content"].stringValue
        self.content_printed.text = content
        //ラッキーアイテムを取得
        let lucky_is = result["item"].stringValue
        self.luckyitem_printed.text = "Lucky item is "+lucky_is
        
    case .failure(_):
         print("error is occured")
        }
        
    }
    

}
}
