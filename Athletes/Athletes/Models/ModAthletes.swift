//
//	ModAthletes.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class ModAthletes : NSObject, NSCoding, Mappable{

	var athletes : [Athlete]?


	class func newInstance(map: Map) -> Mappable?{
		return ModAthletes()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		athletes <- map["athletes"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         athletes = aDecoder.decodeObject(forKey: "athletes") as? [Athlete]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if athletes != nil{
			aCoder.encode(athletes, forKey: "athletes")
		}

	}

}