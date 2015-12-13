# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'chips', 100
    # @set 'playerHand', deck.dealPlayer()
    # @set 'dealerHand', deck.dealDealer()

  newGame: ->
    if @get('deck').length < 13
      initialize()
    @set 'chips', (@get 'chips') - 10
    @set 'bet', 10
    game = new Game(@get('deck'))
    @set 'game', game
    game.on('change:winner',
      =>
        switch @get('game').get 'winner'
          when 'player' then @set 'chips', (@get 'chips') + ((@get 'bet') * 2)
          when 'tie' then @set 'chips', (@get 'chips') + (@get 'bet')
    )

