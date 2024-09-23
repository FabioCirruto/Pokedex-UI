//
//  PokemonViewTests.swift
//  Pokedex-UIUITests
//
//  Created by Fabio Cirruto on 23/09/24.
//

import XCTest
import SnapshotTesting
import Factory
import SwiftUI
import PreviewSnapshotsTesting

@testable import Pokedex_UI

final class PokemonViewTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_pokemoView() throws {
        PokemonView_Previews.snapshots.assertSnapshots(as: .wait(for: 5, on: .image(layout: .device(config: .iPhone12Pro))), record: false)
    }
}
