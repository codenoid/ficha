# Ficha v.0.01.0
![ficha image](https://raw.githubusercontent.com/codenoid/ficha/master/ficha.jpg)
A super secret chat app for any body who need privacy

## Installation
just cd to ficha path
```
./ficha
```
and read Usage below, and you will see
```
[COMPUTER] Ficha online at http://0.0.0.0:2806
[LOCAL NETWORK] Ficha online at http://192.168.100.12:2806
```
default port is 2806 :), its special port

## Usage

to run Ficha, you can use this command
``--port 3232`` set port to 3232
``--mode development`` set mode development
``--help`` for show all command and info
example :
```
$ ./ficha --port 3232 --mode development
```

1. After splash screen, add your username, weird username, cause you need a privacy.
2. The chat time is Minute:Second
3. The chat using web socket
4. Encryption based on CryptoJS (end to end) with random key for every server
5. You can insert HTML tag, like image, youtube video (iframe), javascript script, etc.

## Development

Next, more awesomeness on UI/UX, Encryption, I/O, mention, pull notification, etc
+ safer cryptography :)

## Contributing

1. Fork it ( https://github.com/codenoid/ficha/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## FAQ (maybe)
1. permission denied when i run ficha via terminal. ? = try this command ``chmod +x /path/to/ficha`` (+execute to ficha app)

## Contributors

- [codenoid](https://github.com/codenoid) Rubi Jihantoro - creator, maintainer
- Alfi Cha - Logo Designer and very helpfully person
- Mose on codepen
