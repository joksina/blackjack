# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.Game extends Backbone.Model
  initialize: (deck)->
    # @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on('hit', @checkPlayersHand, @)
    @get('playerHand').on('stand', @compareHands, @)

  bust: (check)->
    if check.minScore() > 21 then true else false

  dealerWins: ->
    @set 'message', 'Try Again!!'
    @set 'winner', 'Dealer'

  playerWins: ->
    @set 'message', 'You Win!!'
    @set 'winner', 'Player'

  tieScore: ->
    @set 'message', 'it is a tie!!!'
    @set 'winner', 'tie'

  checkPlayersHand: ->
    if @bust @get 'playerHand'
      @dealerWins()

  dealerPlay: ->
    dealerHand = @get 'dealerHand'
    score0 = dealerHand.scores()[0]
    score1 = dealerHand.scores()[1]
    # check if the score is less than 17 and greater than 21
    if score0 < 17 and (score1 < 17 or score1 > 21)
      dealerHand.hit()
      @dealerPlay()

  compareHands: ->
    # get the first card at dealers and start comparing
    # for best score
    @get 'dealerHand'
    .at(0)
    .flip()
    @dealerPlay()
    if @bust @get 'dealerHand'
      @playerWins()
    else if @get('playerHand').bestScore() > @get('dealerHand').bestScore()
      @playerWins()
    else if @get('playerHand').bestScore() == @get('dealerHand').bestScore()
      @tieScore()
    else
      @dealerWins()
