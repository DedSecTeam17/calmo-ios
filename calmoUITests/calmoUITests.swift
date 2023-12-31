//
//  calmoUITests.swift
//  calmoUITests
//
//  Created by Mohammed Elamin on 20/08/2023.
//

import XCTest

final class calmoUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOnboardingFlow() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()

        app.launch()
        let splashScreenSkipBtn = app.buttons["splash_screen_skip"]
        XCTAssert(splashScreenSkipBtn.exists)
        splashScreenSkipBtn.tap()

    }


}
