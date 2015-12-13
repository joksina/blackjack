assert = chai.assert
expect = chai.expect
describe "deck constructor", ->

  it "should create a card collection", ->
    collection = new Deck()
    assert.strictEqual collection.length, 52


describe "scoring of hands", ->
  it "should compare the dealer score and player score", ->
    collection = new Deck()
    player = collection.dealPlayer
    dealer = collection.dealDealer
    expect maxScore.to.have.been.called()


