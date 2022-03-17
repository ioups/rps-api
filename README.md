# README
## Welcone to RPS-API
This is a fun little experiment with creating an **API with Ruby on Rails**

### Usage
🕹 **Gameplay**

The Game follow the given sequence : 
- Player sends the API the move to play
- Game engine chooses a move (w/o taking into account the player's move)
- player receives a game result

🖖 **Legal moves:**
- "rock"
- "paper"
- "scissors"

💻 **format**
- Player request 
```
{
"name": "Ponky",
"move": "rock"
}
```
- Expected response
```
{
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
}
```

## Environment

- ruby "2.7.3" or higher
* Use rbenv to manage ruby versions: [instalation instruction](https://github.com/rbenv/rbenv#homebrew-on-macos)
* `rbenv install 2.7.3`
- rails "7.0.1"
-bundler - `gem install bundler`
- rails "7.0.1"- `gem install rails`

## Working locally

### First Installation

    cd /path/to/projects/folder
    git clone git@github.com:ioups/rps-api.git rps-api
    cd rps-api
    gem install bundler
    bundle install   # installs the gems, it may take a while the first time
    touch .env # if you want to customize some elements, and add it to the gitignore

### Running the project

    bin/rails setup
    bin/rails s

Now you can go to http://localhost:3000 (or whatever port number you have used in your `.env` file) and play with the app.


##play the app

- use *postman* or *curl* to send requests like so
* Postman
POST request to `http://localhost:3000/api/v1/play`
with **Body** in **JSON** 
```
{
    "name": "Ponky",
    "move": "paper"

}
```    
* Curl, in your terminal
`curl -i -X POST -d '{ "name":"toto", "move":"rock" }' http://localhost:3000/api/v1/play -H "Content-Type: application/json" `

##NOTES

- The app doesnt use the database so far, no storage needed, so we do not use Models or ActiveRecord

##IDEAS FOR IMPROVEMENT
- handling errors
- handling wrong user inputs
- Authentication, with `devise` and gem `simple_token_authentication`
- Persisting some data: Users, Scores
- Implementing a *Set* feature with something like : a set is 3 or 5 games, or the winner of the set is the 1st to score 3 points.
- a small computer AI that adapts to the player's behavior. with action depending of the oponent's last n actions.
- have fun 😜
