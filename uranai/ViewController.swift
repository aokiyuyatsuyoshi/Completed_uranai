//
//  ViewController.swift
//  uranai
//
//  Created by Yuya Aoki on 2020/03/21.
//  Copyright © 2020 Yuya Aoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    var data_seiza=["Aries(牡羊座)","Taurus(牡牛座)","Gemini(双子座)","Cancer(蟹座)","Leo(獅子座)","Virgo(乙女座)","Libra(天秤座)","Scorpio(蠍座)","Sagittarius(射手座)","Capricorn(山羊座)","Aquarius(水瓶座)","Pisces(魚座)",
    ]
    
    //自動生成　pickerの個数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //自動生成　pickerの数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 12
    }
    
    //pickerの内容をセット
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data_seiza[row]
    }

    @IBOutlet weak var picker_seiza: UIPickerView!
    
    //do_itがクリックされたときresultsegueにてresultへ
    @IBAction func do_it(_ sender: Any) {
        self.performSegue(withIdentifier: "resultsegue", sender: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker_seiza.delegate = self
        self.picker_seiza.dataSource = self
        
    }
    
    //https://qiita.com/treastrain/items/8c298886cc8f3cf124f2参考
    //次の画面へ値を引き継ぐ
    override func prepare(for segue: UIStoryboardSegue,sender:Any?){
        if(segue.identifier == "resultsegue"){
            let next: resultViewController = segue.destination as! resultViewController
            next.pre_flag = picker_seiza.selectedRow(inComponent:0)
        }
    }


}

