//
//  NSObjectExtension.swift
//  文件夹操作
//
//  Created by Lizihao Li on 2021/1/3.
//  Copyright © 2021 Lizihao Li. All rights reserved.
//

import Foundation

extension NSObject {
    
    /// 获取家目录
    /// - Returns: 家目录路径
    func getHomePathZh() -> String
    {
        return  NSHomeDirectory()
    }
    /// 获取Document 目录,尾部没有/
    /// - Returns: Document 目录
    func getDocumentDictionaryZH() -> String {
        let manager = FileManager.default
        let urlsForDocument = manager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentUrl = urlsForDocument[0]
        return documentUrl.path
    }
    
    /// 判断文件是否存在
    /// - Parameter filePath: 文件路径
    /// - Returns: 是否存在
    func judgeFileExistAtPathZH(filePath: String) -> Bool {
        let manager = FileManager.default
        let exist = manager.fileExists(atPath: filePath)
        return exist
    }
    
    
    /// 创建文件夹目录 （即使你提供的文件路径中间有不存在的文件夹，会自动创建，如Document/ownFolder/a,如果ownFolder 不存在，会自动创建ownFolder目录）
    /// - Parameter path: 文件夹路径
    /// - Returns: 是否成功
    func createFolderDirectionaryZH(path:String) -> Bool
       {
           let myDictionary: String = path
           let fileManager = FileManager.default
           //withIntermediateDirectories为ture表示路径中间如果有不存在的文件夹都会创建
        do
        {
            try fileManager.createDirectory(atPath: myDictionary, withIntermediateDirectories: true, attributes: nil)
        }catch
        {
            return false
        }
            return true
       }
    
    /// 删除文件或文件夹 （删除前确保路径存在）
    /// - Parameter path: 文件/文件夹路径
    /// - Returns: 是否删除成功
    func deleteTargetDictionaryZH(path: String) -> Bool{
        let fileManager = FileManager.default
        do {
            try fileManager.removeItem(atPath: path)
        }catch
        {
            return false
        }
        return true
    }
    
    
    /// 创建文件
    /// - Parameters:
    ///   - name: 文件名
    ///   - baseUrl: 基础路径（不含文件名） (结尾不能有/);
    /// - Returns: 创建是否成功(文件已经存在也会返回成功)
    func createFileZH(name: String, baseUrl:URL) -> Bool {
        let manager = FileManager.default
        let file = baseUrl.appendingPathComponent(name)
        let exist = manager.fileExists(atPath: file.path)
        if !exist {
            let suc = manager.createFile(atPath: file.path, contents: nil, attributes: nil)
            if suc {
                print("文件创建成功")
            }
            return suc
        }else
        {
            print("文件已经存在")
            return true
        }
    }
    
    /// 将字符串写入本地文件
    /// - Parameters:
    ///   - strInfo: 字符串
    ///   - filePath: 文件路径
    /// - Returns: 是否成功
    func writeStringToFileZH(strInfo:String, filePath: String) -> Bool {
        let info = strInfo
        do {
            try info.write(toFile: filePath, atomically: true, encoding: .utf8)
        }catch{
            return false
        }
        return true
    }
    
    
    /// 将字典写入本地文件
    /// - Parameters:
    ///   - dictInfo: 字典
    ///   - filePath: 文件路径
    /// - Returns: 是否成功
    func writeDictionaryToFileZH(dictInfo:NSDictionary, filePath: String) -> Bool {
        let info = dictInfo
        let suc = info.write(toFile: filePath, atomically: true)
        return suc
    }
    
    /// 将图片写入本地文件
    /// - Parameters:
    ///   - data: 图片Data数据
    ///   - filePath: 文件路径
    /// - Returns: 是否成功
    func writeImageToFileZH(data:NSData, filePath: String) -> Bool
    {
        do {
            try data.write(to: URL(fileURLWithPath: filePath))
        }catch{
            return false
        }
        return true
    }
    
    /// 从本地文件读取字符串
    /// - Parameter filePath: 文件路径
    /// - Returns: 字符串，失败返回“”
    func readContentOfFileZH(filePath: String) -> String? {
        if let readHandler = try? FileHandle(forReadingFrom: URL(fileURLWithPath: filePath))
        {
            let data = readHandler.readDataToEndOfFile()
            let readString = String(data: data, encoding: .utf8)
            return readString
        }else
        {
            return ""
        }
    }
    
    /// 读取Data 数据
    /// - Parameter filePath: 文件路径
    /// - Returns: 可选Data
    func readContentOfFileForDataFormatZH(filePath: String) -> Data? {
        let manager = FileManager.default
        let data =  manager.contents(atPath: filePath)
        return data
    }
    
    /// 深度遍历路径下的文件和子目录（不会递归符号链接）
       /// - Parameter dictionary: 路径
       func searchDetailContentsOfDictionaryZH(dictionary: String)  {
            let manager = FileManager.default
           if let contentsOfPath = manager.enumerator(atPath: dictionary)
           {
               print(contentsOfPath.allObjects)
           }
       }
    
}
