//
//  DLParseUtilities.swift
//  LearingCodable
//
//  Created by 曹洸铭 on 2019/3/20.
//  Copyright © 2019 曹洸铭. All rights reserved.
//  数据解析及相关的数据持久化

import Foundation

class CJParseUtilities {
    /// 将JSON数据转换成模型类
    public class func decodeJSONData<T>(type: T.Type, data: Data?) -> T? where T: Codable {
        if let data = data {
            do {
                let model = try JSONDecoder().decode(type, from: data)
                return model
            } catch let error {
                print(error)
                return nil
            }
        } else {
            print("数据源为空")
            return nil
        }
    }
    
    /// 将模型对象编码
    public class func encode<Value>(_ value: Value?) -> Data? where Value : Encodable {
        if let value = value {
            do {
                let data = try PropertyListEncoder().encode(value)
                return data
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
    
    /// 将数据解码
    public class func decode<T>(_ value: T.Type, data: Data?) -> T? where T : Decodable {
        if let data = data {
            do {
                let model = try PropertyListDecoder().decode(value, from: data)
                return model
            } catch let error {
                print(error)
                return nil
            }
        }
        return nil
    }
    
    /// 将模型对象写入plist
    public class func encodePlist<Value>(_ value: Value?, key: String) -> Bool where Value: Encodable {
        let data = CJParseUtilities.encode(value)
        
        if let data = data {
            UserDefaults.standard.setValue(data, forKeyPath: key)
            return true
        } else {
            return false
        }
    }
    
    /// 将plist对象转化成模型类
    public class func decodePlist<Value>(_ value: Value.Type, key: String) -> Value? where Value : Decodable {
        let data = UserDefaults.standard.data(forKey: key)
        return CJParseUtilities.decode(value, data: data)
    }
    
    /// 将模型类归档
    public class func archive<Value>(_ value: Value?, fileName: String) -> Bool where Value : Encodable {
        let data = CJParseUtilities.encode(value)
        if let data = data {
            if #available(iOS 11.0, *) {
                do {
                    let archiveData = try NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: true)
                    try archiveData.write(to: CJParseUtilities.fileURL(fileName))
                    return true
                } catch let error {
                    print(error)
                    return false
                }
            } else {
                return NSKeyedArchiver.archiveRootObject(data, toFile: CJParseUtilities.fileString(fileName))
            }
        }
        return false
    }
    
    /// 解档成模型类
    public class func unarchive<T>(_ value: T.Type , _ fileName: String) -> T? where T : Decodable {
        if #available(iOS 11.0, *) {
            
            do {
                let pathURL = CJParseUtilities.fileURL(fileName)
                let data = try Data(contentsOf: pathURL)
                let finalData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Data
                return CJParseUtilities.decode(value, data: finalData)
            } catch {
                return nil
            }
        } else {
            let data = NSKeyedUnarchiver.unarchiveObject(withFile: CJParseUtilities.fileString(fileName)) as? Data
            return CJParseUtilities.decode(value, data: data)
        }
        
        
        
        
        
    }
    
    /// 获取文件路径URL
    public class func fileURL(_ fileName: String) -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentUrl = urls[0].appendingPathComponent(fileName)
        return documentUrl
    }
    
    /// 获取文件路径String
    private class func fileString(_ fileName: String) -> String {
        let doc = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        print(doc)
        return doc + "/" + fileName
    }
}
