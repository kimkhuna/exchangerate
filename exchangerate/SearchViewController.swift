//
//  SearchViewController.swift
//  exchangerate
//
//  Created by 김경훈 on 2022/10/01.
//

import UIKit
import Alamofire
import SwiftyJSON

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
  
    @IBOutlet weak var tableView: UITableView!
     
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var lists = [[String:Any]]()
    var countrys = [String]()
    var basePrices = [String]()
    var units = [String]()
    
    
    var countryValue: String?
    var basePriceValue: String?
    var unitValue: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        tableView.delegate = self
        tableView.dataSource = self

        self.callJSONData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func callJSONData(){
        let parameter: Parameters = ["authkey" : "your_Key", "data" : "AP01"]
        let url = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=your_Key&data=AP01"


        Alamofire.request(url, method: .get, parameters: parameter, headers: ["Content-Type" : "application/json", "Accept" : "application/json"]
        ).validate(statusCode: 200..<300)
            .responseJSON(completionHandler: {
                (response) in
//                print(response)
                self.parseJSON(response)
                
                
            })
    }
    
    func parseJSON(_ response: DataResponse<Any>){

            switch response.result{
            case .success(_):

                let json = try! JSONSerialization.jsonObject(with: response.data!, options: []) as! [[String:Any]]
                self.lists = json

                if let list = self.lists as? [[String:Any]]{
                    for indexs in list{
                        self.countrys.append(indexs["cur_nm"] as! String)
                        self.basePrices.append(indexs["kftc_deal_bas_r"] as! String)
                        self.units.append(indexs["cur_unit"] as! String)
                        
                    }
                    self.tableView.reloadData()
                }
                
            case .failure(_) :
                print("통신오류",String(describing: response.result.error))
                
            }

        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return countrys.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ListCell",
                                                      for: indexPath) as! ListTableViewCell
    
        cell.countryLabel.text = self.countrys[indexPath.row]
        cell.basePriceLabel.text = self.basePrices[indexPath.row]
        cell.unitLabel.text = self.units[indexPath.row]
        

        
        if cell.countryLabel.text == "아랍에미리트 디르함"{
            cell.countryImgView!.image = UIImage(named: "AED.png")
        }
        else if cell.countryLabel.text == "오스트리아 실링"{
            cell.countryImgView!.image = UIImage(named: "ATS.png")
        }
        else if cell.countryLabel.text == "호주 달러"{
            cell.countryImgView!.image = UIImage(named: "AUD.png")
        }
        else if cell.countryLabel.text == "벨기에 프랑"{
            cell.countryImgView!.image = UIImage(named: "BEF.png")
        }
        else if cell.countryLabel.text == "바레인 디나르"{
            cell.countryImgView!.image = UIImage(named: "BHD.png")
        }
        else if cell.countryLabel.text == "캐나다 달러"{
            cell.countryImgView!.image = UIImage(named: "CAD.png")
        }
        else if cell.countryLabel.text == "스위스 프랑"{
            cell.countryImgView!.image = UIImage(named: "CHF.png")
        }
        else if cell.countryLabel.text == "위안화"{
            cell.countryImgView!.image = UIImage(named: "CNH.png")
        }
        else if cell.countryLabel.text == "독일 마르크"{
            cell.countryImgView!.image = UIImage(named: "DM.png")
        }
        else if cell.countryLabel.text == "덴마아크 크로네"{
            cell.countryImgView!.image = UIImage(named: "DKK.png")
        }
        else if cell.countryLabel.text == "스페인 페세타"{
            cell.countryImgView!.image = UIImage(named: "ESP.png")
        }
        else if cell.countryLabel.text == "유로"{
            cell.countryImgView!.image = UIImage(named: "EUR.png")
        }
        else if cell.countryLabel.text == "핀란드 마르카"{
            cell.countryImgView!.image = UIImage(named: "FIM.png")
        }
        else if cell.countryLabel.text == "프랑스 프랑"{
            cell.countryImgView!.image = UIImage(named: "FRF.png")
        }
        else if cell.countryLabel.text == "영국 파운드"{
            cell.countryImgView!.image = UIImage(named: "GBP.png")
        }
        else if cell.countryLabel.text == "홍콩 달러"{
            cell.countryImgView!.image = UIImage(named: "HKD.png")
        }
        else if cell.countryLabel.text == "인도네시아 루피아"{
            cell.countryImgView!.image = UIImage(named: "IDR.png")
        }
        else if cell.countryLabel.text == "이태리 리라"{
            cell.countryImgView!.image = UIImage(named: "ITL.png")
        }
        else if cell.countryLabel.text == "일본 옌"{
            cell.countryImgView!.image = UIImage(named: "JPY.png")
        }
        else if cell.countryLabel.text == "한국 원"{
            cell.countryImgView!.image = UIImage(named: "KRW.png")
        }
        else if cell.countryLabel.text == "쿠웨이트 디나르"{
            cell.countryImgView!.image = UIImage(named: "KWD.png")
        }
        else if cell.countryLabel.text == "말레이지아 링기트"{
            cell.countryImgView!.image = UIImage(named: "MYR.png")
        }
        else if cell.countryLabel.text == "네덜란드 길더"{
            cell.countryImgView!.image = UIImage(named: "NLG.png")
        }
        else if cell.countryLabel.text == "노르웨이 크로네"{
            cell.countryImgView!.image = UIImage(named: "NOK.png")
        }
        else if cell.countryLabel.text == "뉴질랜드 달러"{
            cell.countryImgView!.image = UIImage(named: "NZD.png")
        }
        else if cell.countryLabel.text == "사우디 리얄"{
            cell.countryImgView!.image = UIImage(named: "SAR.png")
        }
        else if cell.countryLabel.text == "싱가포르 달러"{
            cell.countryImgView!.image = UIImage(named: "SGD.png")
        }
        else if cell.countryLabel.text == "태국 바트"{
            cell.countryImgView!.image = UIImage(named: "THB.png")
        }
        else if cell.countryLabel.text == "미국 달러"{
            cell.countryImgView!.image = UIImage(named: "USD.png")
        }
        else if cell.countryLabel.text == "씨에프에이 프랑(비씨에이오)"{
            cell.countryImgView!.image = UIImage(named: "ECOWAS.png")
        }
        else if cell.countryLabel.text == "브루나이 달러"{
            cell.countryImgView!.image = UIImage(named: "BND.png")
        }else{
            cell.countryImgView!.image = UIImage(named: "")
        }
        
        

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        performSegue(withIdentifier: "MainVC", sender: indexPath.row)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let vc = segue.destination as? MainViewController
        {
            if let index = sender as? Int{
                vc.country = countrys[index]
                vc.unit = units[index]
                vc.basePrice = basePrices[index]
               
            }
        }
            
    }


}
