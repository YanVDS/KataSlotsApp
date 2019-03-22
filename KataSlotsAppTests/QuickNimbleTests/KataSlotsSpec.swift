//
//  KataSlotsSpec.swift
//  KataSlotsAppTests
//
//  Created by Yannick Vanderstraeten on 22/03/2019.
//  Copyright © 2019 TeleSoftas. All rights reserved.
//

import Quick
import Nimble

@testable import KataSlotsApp

class KataSlotsSpec: QuickSpec {

    override func spec() {
        var slotsViewController: KataSlotsViewController!

        describe("SlotsApp") {
            context("when getting number of slots") {
                beforeEach {
                    slotsViewController = KataSlotsViewController()
                    _ = slotsViewController.view
                }

                it("returns 3 slots") {
                    expect(slotsViewController.numberOfSlots()).to(equal(3))
                }
            }
        }

    }

}
