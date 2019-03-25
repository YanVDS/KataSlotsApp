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
        var vendorMachine: VendorMachine!

        beforeEach {
            vendorMachine = VendorMachine()
        }

        describe("SlotsApp") {
            context("when two of all types of coins inserted") {
                beforeEach {
                    vendorMachine.insertNickel()
                    vendorMachine.insertNickel()
                    vendorMachine.insertDime()
                    vendorMachine.insertDime()
                    vendorMachine.insertQuarter()
                    vendorMachine.insertQuarter()
                    vendorMachine.insertDollar()
                    vendorMachine.insertDollar()
                }

                it("returns two of all types of coins") {
                    expect(vendorMachine.returnCoins()).to(contain([Coin.nickel, Coin.nickel]))
                    expect(vendorMachine.returnCoins()).to(contain([Coin.dime, Coin.dime]))
                    expect(vendorMachine.returnCoins()).to(contain([Coin.quarter, Coin.quarter]))
                    expect(vendorMachine.returnCoins()).to(contain([Coin.dollar, Coin.dollar]))
                }
            }

            context("when all types of coins inserted") {
                beforeEach {
                    vendorMachine.insertNickel()
                    vendorMachine.insertDime()
                    vendorMachine.insertQuarter()
                    vendorMachine.insertDollar()
                }

                it("returns all inserted coins") {
                    expect(vendorMachine.returnCoins()).to(contain(Coin.nickel))
                    expect(vendorMachine.returnCoins()).to(contain(Coin.dime))
                    expect(vendorMachine.returnCoins()).to(contain(Coin.quarter))
                    expect(vendorMachine.returnCoins()).to(contain(Coin.dollar))
                }
            }

            context("when no coins inserted and getting item A") {
                it("should return not enough coins") {
                    expect(vendorMachine.itemA()).to(equal("NOT ENOUGH COINS"))
                }
            }

            context("when a nickle, dime and two quarters are inserted and getting item A") {
                beforeEach {
                    vendorMachine.insertNickel()
                    vendorMachine.insertDime()
                    vendorMachine.insertQuarter()
                    vendorMachine.insertQuarter()
                }

                it("should return item A") {
                    expect(vendorMachine.itemA()).to(equal("A"))
                }
            }

            context("when a dollar is inserted and getting item A") {
                beforeEach {
                    vendorMachine.insertDollar()
                }

                it("should return item A") {
                    expect(vendorMachine.itemA()).to(equal("A"))
                }
            }

            context("when no coins inserted and getting item B") {
                it("should return not enough coins") {
                    expect(vendorMachine.itemB()).to(equal("NOT ENOUGH COINS"))
                }
            }

            context("when a dollar is inserted and getting item B") {
                beforeEach {
                    vendorMachine.insertDollar()
                }

                it("should return item B") {
                    expect(vendorMachine.itemB()).to(equal("B"))
                }
            }

            context("when 2 dollars are inserted and getting item B") {
                beforeEach {
                    vendorMachine.insertDollar()
                    vendorMachine.insertDollar()
                }

                it("should return item B") {
                    expect(vendorMachine.itemB()).to(equal("B"))
                }
            }

            context("when no coins inserted and getting item C") {
                it("should return not enough coins") {
                    expect(vendorMachine.itemC()).to(equal("NOT ENOUGH COINS"))
                }
            }

            context("when a dollar and 2 quarters are inserted and getting item C") {
                beforeEach {
                    vendorMachine.insertDollar()
                    vendorMachine.insertQuarter()
                    vendorMachine.insertQuarter()
                }

                it("should return item C") {
                    expect(vendorMachine.itemC()).to(equal("C"))
                }
            }

            context("when 2 dollars are inserted and getting item C") {
                beforeEach {
                    vendorMachine.insertDollar()
                    vendorMachine.insertDollar()
                }

                it("should return item C") {
                    expect(vendorMachine.itemC()).to(equal("C"))
                }
            }

            context("when exact coins for item A are inserted and item A bought") {
                beforeEach {
                    vendorMachine.insertNickel()
                    vendorMachine.insertDime()
                    vendorMachine.insertQuarter()
                    vendorMachine.insertQuarter()
                    vendorMachine.itemA()
                }

                it("should return no coins") {
                    expect(vendorMachine.returnCoins()).to(equal([]))
                }
            }

            context("when 1 dollar for item A is inserted and item A bought") {
                beforeEach {
                    vendorMachine.insertDollar()
                    vendorMachine.itemA()
                }

                it("should return no coins") {
                    expect(vendorMachine.returnCoins()).to(equal([]))
                }
            }

            context("when 20 nickels for item A are inserted and item A bought") {
                beforeEach {
                    addNickels(20)
                    vendorMachine.itemA()
                }

                it("should return 7 nickels") {
                    expect(vendorMachine.returnCoins().filter{$0 == Coin.nickel}.count).to(equal(7))
                }
            }

            context("when 3 nickels, 3 dimes, 3 quarters for item A are inserted and item A bought") {
                beforeEach {
                    addNickels(3)
                    addDimes(3)
                    addQuarters(3)
                    vendorMachine.itemA()
                }

                it("should return 2 nickels, 2 dime, 1 quarter") {
                    expect(vendorMachine.returnCoins().filter{$0 == Coin.nickel}.count).to(equal(2))
                    expect(vendorMachine.returnCoins().filter{$0 == Coin.dime}.count).to(equal(1))
                    expect(vendorMachine.returnCoins().filter{$0 == Coin.quarter}.count).to(equal(1))
                }
            }
        }

        func addNickels(_ count: Int) {
            for _ in 1...count {
                vendorMachine.insertNickel()
            }
        }

        func addDimes(_ count: Int) {
            for _ in 1...count {
                vendorMachine.insertDime()
            }
        }

        func addQuarters(_ count: Int) {
            for _ in 1...count {
                vendorMachine.insertQuarter()
            }
        }
    }
}
