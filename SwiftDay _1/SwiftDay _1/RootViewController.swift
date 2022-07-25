//
//  RootViewController.swift
//  SwiftDay _1
//
//  Created by Yanghe on 2022/7/14.
//

import UIKit
import SnapKit

class RootViewController: UIViewController {

    var playBtn = UIButton(type: UIButton.ButtonType.custom);
    var pauseBtn = UIButton(type: UIButton.ButtonType.custom);
    var timeLb  = UILabel.init();
    var restBtn = UIButton(type: .custom);
    
    var timer = Timer();
    var counter = 0.0;
    var isPlaying = false;
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createBtn()
        createText();
        createTime();
        
    }
    
    func createTime(){
        
    }
    
    func createText(){
        self.timeLb.font = UIFont.systemFont(ofSize: 20*pix, weight: UIFont.Weight.semibold);
        self.timeLb.textColor = UIColor.white;
        self.timeLb.textAlignment = NSTextAlignment.center;
        self.view.addSubview(self.timeLb);
        self.timeLb.snp.makeConstraints { make in
            make.centerX.equalToSuperview();
            make.top.equalTo(self.view.snp_topMargin).offset(60);
            make.height.equalTo(50);
        };
        self.timeLb.text = "0.0";
    }
    
    func createBtn(){
        let leftView = UIView.init();
        leftView.backgroundColor = UIColor.green;
        self.view.addSubview(leftView);
        leftView.snp.makeConstraints { make in
            make.width.equalTo(SCREEN_WIDTH/2);
            make.bottom.equalTo(self.view.snp_bottomMargin);
            make.height.equalTo(300);
        }
        
        let rightView = UIView.init();
        rightView.backgroundColor = UIColor.blue;
        self.view.addSubview(rightView);
        rightView.snp.makeConstraints { make in
            make.left.equalTo(leftView.snp.right).offset(0);
            make.width.equalTo(SCREEN_WIDTH/2);
            make.bottom.equalTo(leftView.snp.bottom);
            make.height.equalTo(300);
        }
        
        self.playBtn.setBackgroundImage(UIImage.init(named: "play"), for: .normal);
        leftView.addSubview(self.playBtn);
        self.playBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview();
            make.centerY.equalToSuperview();
            make.width.equalTo(pix * 40);
            make.height.equalTo(pix * 40);
        };
        self.playBtn.addTarget(self, action:#selector(playBtnAction), for: UIControl.Event.touchUpInside)
        
        self.pauseBtn.setBackgroundImage(UIImage.init(named: "pause"), for: .normal);
        rightView.addSubview(self.pauseBtn);
        self.pauseBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview();
            make.centerY.equalToSuperview();
            make.width.equalTo(pix * 40);
            make.height.equalTo(pix * 40);
        }
        self.pauseBtn.addTarget(self, action: #selector(pauseBtnAction), for: UIControl.Event.touchUpInside);
        
        self.restBtn.setTitle("Reset", for: UIControl.State.normal);
        self.restBtn.setTitleColor(UIColor.white, for: .normal);
        self.restBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold);
        self.view.addSubview(self.restBtn);
        self.restBtn.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp_topMargin).offset(20);
            make.right.equalToSuperview().offset(-20);
            make.height.equalTo(30);
        };
        
        self.restBtn.addTarget(self, action: #selector(restBtnAction), for: UIControl.Event.touchUpInside);
        
        
    }
    
    @objc func playBtnAction(){
        print("play play play");
        if isPlaying {
            return;
        }
        self.isPlaying = true;
        self.pauseBtn.isEnabled = true;
        self.playBtn.isEnabled = false;
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timeEvent), userInfo: nil, repeats: true);
    }
    @objc func pauseBtnAction(){
        print(" pause pause");
        self.playBtn.isEnabled = true;
        self.pauseBtn.isEnabled = false;
        self.timer.invalidate();
        self.isPlaying = false;
    }
    
    @objc func timeEvent(){
        self.counter = self.counter + 0.1;
        self.timeLb.text = String(format: "%0.1f", self.counter);
    }
    
    @objc func restBtnAction() {
        self.isPlaying = false;
        self.counter = 0.0;
        self.timeLb.text = "0.0";
        self.timer.invalidate();
        self.playBtn.isEnabled = true;
        self.pauseBtn.isEnabled = true;
    }

}
