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
    maxScore = collection.maxScore
    expect(maxScore).to.have.been.called


describe "bust", ->
  it "should print a message when player exceeds 21", ->
    collection = new Deck()
    player = collection.dealPlayer
    bust = collection.bust
    expect(bust).to.have.been.called

describe "draw", ->
  it "draw should have been called", ->
    collection = new Deck()
    player = collection.dealPlayer
    dealer = collection.dealPlayer
    compare = collection.compareHands
    expect(compare).to.have.been.called
  it "should check player score and dealer score", ->
    collection = new Deck()
    player = collection.dealPlayer
    dealer = collection.dealPlayer
    compare = collection.compareHands
    expect(player).to.equal(dealer)