//
//  ViewController.swift
//  文件夹操作
//
//  Created by Lizihao Li on 2021/1/2.
//  Copyright © 2021 Lizihao Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        
        let myImageView: UIImageView?
        myImageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 50, height: 50))
        myImageView?.backgroundColor = UIColor.red
        self.view.addSubview(myImageView!)
        
        //我们获取用户文档Documents目录路径
       let manager = FileManager.default
        let documentPath = getDocumentDictionaryZH()
        print(documentPath)
        
       
        
        let homePath = getHomePathZh()
        print("home=\(homePath)")
        
        //判断文件或文件夹是否存在
        let filePath: String = documentPath + "/myFolder"
        let exist = judgeFileExistAtPathZH(filePath: filePath)
        if exist {
            print("文件夹存在")
        }else
        {
            print("文件夹不存在直接创建")
            createFolderDirectionaryZH(path: filePath)
        }
        
        let stringFileName = "hangge.txt"
        let stringFilePath = filePath + "/" + stringFileName
        createFileZH(name: stringFileName, baseUrl: URL(fileURLWithPath: filePath))
        
        
       // 创建存放字典的dict.txt文件
        let dictFileName = "dict.txt"
        let dictFilePath = filePath + "/" + dictFileName
        createFileZH(name: dictFileName, baseUrl: URL(fileURLWithPath: filePath))
        //创建存放图片的image.txt文件
        let imageFileName = "image.txt"
        let imagetFilePath = filePath + "/" + imageFileName
        createFileZH(name: imageFileName, baseUrl: URL(fileURLWithPath: filePath))
        
        //hangge.txt 写入字符串
       // writeStringToFile(strInfo: "it is hange study", filePath: stringFilePath)
        
        if writeStringToFileZH(strInfo: "sddsd ", filePath: stringFilePath){
            print("字符串写入成功")
        }else
        {
            print("字符串写入失败")
        }
        
        //字典文件写入字典
        writeDictionaryToFileZH(dictInfo: ["name":"lzh","age":12], filePath: dictFilePath)
        //图片文件写入图片
        if let image = UIImage(named: "a3")
        {   print("找到图片")
            writeImageToFileZH(data: image.pngData() as! NSData, filePath: imagetFilePath)

        }else
        {
            print("未找到图片")
        }
        if let resultStr = readContentOfFileZH(filePath: stringFilePath)
        {
            print("读取到的字符串内容： \(resultStr)")
        }else
        {
            print("没有字符串内容")
        }
        if let resultStr = readContentOfFileZH(filePath: dictFilePath)
        {
            print("读取到的字典内容： \(resultStr)")
        }else
        {
            print("没有字典内容")
        }
        
        if let resultData = readContentOfFileForDataFormatZH(filePath: imagetFilePath)
        {
            print("读取到的图片内容： \(resultData)")
            let image = UIImage(data: resultData)
            myImageView?.image = image
            
            
        }else
        {
            print("没有读取到图片内容")
        }
        
         //deleteTargetDictionaryZH(path: documentPath)
        searchDetailContentsOfDictionaryZH(dictionary:documentPath)
       
    }
    
    

    
    //(浅遍历)遍历路径下的文件和子目录，符号链接的列表(只会返回一级内容)
    func searchContentsOfDictionary(dictionary: String)  {
         let manager = FileManager.default
        let contentsOfPath = try? manager.contentsOfDirectory(atPath: dictionary)
        if contentsOfPath != nil
        {
            print(contentsOfPath!)
        }
    }
    
    
}

