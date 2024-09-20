//
//  EndpointTests.swift
//  Pokedex-UITests
//
//  Created by Fabio Cirruto on 20/09/24.
//

import XCTest
@testable import Pokedex_UI

final class EndpointTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_list_endpoint_well_formed() {
        let list = EndPoint.List(3, 0)
        XCTAssertEqual(list.basePath, Enviroment.apiUrl)
        XCTAssertEqual(list.method, APIMethod.get.rawValue)
        XCTAssertEqual(list.urlParameters?.count, 2)
        XCTAssertNotNil(list.urlParameters?["limit"])
        XCTAssertNotNil(list.urlParameters?["offset"])
        XCTAssertEqual(list.urlParameters?["limit"] as? Int, 3)
        XCTAssertEqual(list.urlParameters?["offset"] as? Int, 0)
    }
    
    func test_detail_endpoint_well_formed() {
        let detail = EndPoint.Detail("https://pokeapi.co/api/v2/pokemon/1/")
        XCTAssertEqual(detail.basePath, "https://pokeapi.co/api/v2/pokemon/1/")
        XCTAssertEqual(detail.method, APIMethod.get.rawValue)
        XCTAssertNil(detail.urlParameters)
    }
    
    func test_desc_endpoint_well_formed() {
        let desc = EndPoint.Desc("https://pokeapi.co/api/v2/pokemon-species/1/")
        XCTAssertEqual(desc.basePath, "https://pokeapi.co/api/v2/pokemon-species/1/")
        XCTAssertEqual(desc.method, APIMethod.get.rawValue)
        XCTAssertNil(desc.urlParameters)
    }

}
