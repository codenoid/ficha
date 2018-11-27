# MOVED TO https://github.com/geheim-Chat

# Ficha [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/veelenga/awesome-crystal)

![ficha image](https://raw.githubusercontent.com/codenoid/ficha/master/ficha.jpg)
A super secret chat app for any body who need privacy

## Installation
First, you must have Crystal Programming Language installed in your machine, [Follow This Guide](http://jihantoro.net/read/install-crystal-language-on-ubuntu)

Ficha come with 2 type file, server app and client app.
### Server Installation
1. ``cd`` to ficha/server path
2. use ``./sentry`` or ``crystal build --release src/ficha.cr ``
3. `` ./sentry `` comes with auto run (and without setting any argument), but in crystal build you can ran manually by typing `` ./ficha --cmd [args] ``

### Client Installation
1. ``cd`` to ficha/client path
2. use ``./sentry`` or ``crystal build --release src/client.cr ``
3. `` ./sentry `` comes with auto run (and without setting any argument), but in crystal build you can ran manually by typing `` ./client --cmd [args] ``

## Usage
Usage info for server and client

### Server Usage
Example way to activate The Server
```
$ ./ficha --port 2121 --dbpath sq.qyuel --write
```
`` sq.qyuel `` is sqlite db file, mean you use sqlite db

`` text.cha `` is text plain file, mean you use text plain as as your db

This cute machine automaticly check, is this sqlite db ?..

`` --write `` command mean, user can update the db.

without ``--write`` mean, when you reload a client side, the value of choosed db will showed, but when user create some message, data will not saved.

and you will see
```
[COMPUTER] Ficha online at http://0.0.0.0:2121
[LOCAL NETWORK] Ficha online at http://192.168.100.12:2121
```
### Client Usage
example args for activating the client app
```
$ ./client --ip 0.0.0.0:2121 --key ayambawang --port 2000
```
Command info
1. `` --ip 0.0.0.0:2121 `` is the server ip.
2. `` --key ayambawang `` is a main secret key of old / new message.
3. `` --port `` set your client port.

and you will see
```
[COMPUTER] Ficha online at http://0.0.0.0:2000
[LOCAL NETWORK] Ficha online at http://192.168.100.12:2000
```

1. After splash screen, add your username, weird username, cause you need a privacy.
2. The chat time is Minute:Second
3. The chat using web socket
4. Encryption based on CryptoJS (end to end).
5. You can insert HTML tag, like image, youtube video (iframe), javascript script, etc.
6. anytime any where deploy

## Development

- [x] Adding a memorable logo
- [x] Use memorable name
- [x] End To End Encryption
- [ ] Fix untrached Bug
- [ ] Apperance, change theme, font and markdown
- [ ] More interactive console & console log
- [ ] Frontend Cryptography
- [ ] Cross Compile Binary file with auto symlink (to lib)
- [ ] Frontend, notification when new message is come
- [ ] Mention other people
- [ ] More interactive server info inside the room
- [ ] .sh / bash auto installation
- [ ] CLI version (more safer)

## Contributing

1. Fork it ( https://github.com/codenoid/ficha/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## FAQ (maybe)
1. permission denied when i run ficha via terminal. ? = try this command ``chmod +x /path/to/ficha`` (+execute to ficha app)
2. libgc.so.2: cannot open shared object = try tu run `` sudo apt-get install libgc1c2:i386 ``(install libgc lib)

## Contributors

- [codenoid](https://github.com/codenoid) Rubi Jihantoro - creator, maintainer
- Alfi Cha - Logo Designer and very helpfully person
- Mose on codepen
- All of my friend on [Crystal](https://gitter.im/crystal-lang/crystal) , [Kemal](https://gitter.im/sdogruyol/kemal) , etc
