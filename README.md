# README
## Welcone to RPS-API
This is a fun little experiment with creating an ***API with Ruby on Rails***

### Usage
*** 🕹 Gameplay ***
The Game follow the given sequence : 
- Player sends the API the move to play
- Game engine chooses a move (w/o taking into account the player's move)
- player receives a game result

*** 👮‍♀️ Legal moves: ***
- "rock"
- "paper"
- "scissors"

*** 💻 format ***
- Player request 
`{
"name": "Ponky",
"move": "rock"
}`
- Expected response
`{
  "moves": [
  {
  "name": "Ponky",
  "move": "rock"
  },
  {
  "name": "Bot",
  "move": "scissor"
  }
  ],
  "result": {
  "tie": false,
  "winner": "Ponky"
  }
}`

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
