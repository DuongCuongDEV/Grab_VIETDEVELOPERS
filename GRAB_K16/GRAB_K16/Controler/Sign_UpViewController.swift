//
//  Sign_UpViewController.swift
//  GRAB_K16
//
//  Created by yenyen on 20/12/2022.
//

import UIKit
import Kingfisher
import SwiftUI



class Sign_UpViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var tinhsData:Tinhs = []
    var huyensData: Huyens = []
    var xasData: Xas = []

    
    let toolBar = UIToolbar()
    
    
    //API Tinh
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print("Vào case 1\(pickerView.tag)")
        switch pickerView.tag{
          
        case 1:
//            print("vao case1")
            return tinhsData.count
        case 2:
//            print("case huyen")
            return huyensData.count
        case 3:
//            print("case xa")
            return xasData.count
        default:
           
            return tinhsData.count
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView.tag{
        case 1:
           
            return tinhsData[row].tenTinh
        case 2:
           
            return huyensData[row].tenHuyen
        case 3:
           
            return xasData[row].tenXa
        default:
          
            return tinhsData[row].tenTinh
        }
   
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView.tag{
        case 1:
            txtProvince.text = tinhsData[row].tenTinh
            txtProvince.resignFirstResponder()
            getHuyensFromAPI(tinhId: "\(tinhsData[row].maTinh)")
            print("Các tỉnh\(tinhsData[row])")
            break
        case 2:
            txtDistrict.text = huyensData[row].tenHuyen
            txtDistrict.resignFirstResponder()
            getXasFromAPI(huyenId: "\(huyensData[row].maHuyen)")
        
            print("Các huyện\(huyensData[row])")
            break
        case 3:
            txtCommune.text = xasData[row].tenXa
            txtCommune.resignFirstResponder()
            break
            
        default:
            break
        }
  }
    
   

    let defaults = UserDefaults.standard
    


   
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var txtCommune: UITextField!
            var CommuneViewPicker = UIPickerView()
    @IBOutlet weak var txtDistrict: UITextField!
            var DistrictViewPicker = UIPickerView()
    @IBOutlet weak var txtProvince: UITextField!
            var ProvinceViewPicker = UIPickerView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        
        txtCommune.inputView = CommuneViewPicker
        txtDistrict.inputView = DistrictViewPicker
        txtProvince.inputView = ProvinceViewPicker
        
//        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed))
//        toolBar.items = [doneBtn]
        txtProvince.inputAccessoryView = toolBar
        txtDistrict.inputAccessoryView = toolBar
        txtCommune.inputAccessoryView = toolBar
        
        CommuneViewPicker.delegate = self
        CommuneViewPicker.dataSource = self
        DistrictViewPicker.delegate = self
        DistrictViewPicker.dataSource = self
        ProvinceViewPicker.delegate = self
        ProvinceViewPicker.dataSource = self
        
        
        CommuneViewPicker.tag = 3
        DistrictViewPicker.tag = 2
        ProvinceViewPicker.tag = 1
        
       
        
       

        txtProvince.layer.borderWidth = 2
        txtProvince.layer.cornerRadius = 5
        txtProvince.layer.borderColor = UIColor.orange.cgColor
        txtProvince.layer.masksToBounds = true

        txtDistrict.layer.borderWidth = 2
        txtDistrict.layer.cornerRadius = 5
        txtDistrict.layer.borderColor = UIColor.orange.cgColor
        txtDistrict.layer.masksToBounds = true

        txtCommune.layer.borderWidth = 2
        txtCommune.layer.cornerRadius = 5
        txtCommune.layer.borderColor = UIColor.orange.cgColor
        txtDistrict.layer.masksToBounds = true
        
        getTinhsFromAPI()

        

    }
    @objc func doneButtonPressed(){
        self.view.endEditing(true)
        
    }
  
    func getTinhsFromAPI(){

            print ("Da goi API nen khong can goi nua")
            
            APIGrabHandler.init().getTinhs{
                tinhsReponseData in
                self.tinhsData = tinhsReponseData
                self.defaults.set(true, forKey: "calledAPI")
                print("tinh\(tinhsReponseData)")
//                self.txtProvince.reloadData()
                print(self.tinhsData[0])
  
            }
    }
    func getHuyensFromAPI(tinhId: String){


        APIGrabHandler.init().getHuyens(tinhId: tinhId){
                huyensReponseData in

                self.huyensData = huyensReponseData
                self.defaults.set(true, forKey: "calledAPI")
                print("huyen\(huyensReponseData)")
//                self.txtProvince.reloadData()

            }
//        }
    }
    func getXasFromAPI(huyenId: String){
  //        let isCalledAPI = defaults.bool(forKey: "calledAPI")
  //        if !isCalledAPI {
              print ("Da goi API nen khong can goi nua")

          APIGrabHandler.init().getXas(huyenId: huyenId){
                  xasReponseData in

                  self.xasData = xasReponseData
                  self.defaults.set(true, forKey: "calledAPI")
     
  //
              }
      }

}

