Pretty Eshell 
===============
Pretty Eshell - A Renovate Erlang Shell with Colorfull Syntax Highlight.

## Screenshots

Take on Ubuntu with Default Terminal.

![Pretty Eshell](https://github.com/spawnfest/ErlShell/blob/master/docs/rsz_pretty-eshell-1.png)

![Pretty Eshell](https://github.com/spawnfest/ErlShell/blob/master/docs/rsz_1pretty-eshell-02.png)

## Dependencies

* Erlang OTP 20 (stdlib-3.4)

## How to install ##

Clone:
~~~
  $ git clone --recursive https://github.com/spawnfest/ErlShell.git
~~~ 
Automatically (you may need to run this command with `sudo` and run erl shell with `sudo`):

 `$ make install`
 
Manually:

1. Find out what version of the stdlib library you're using by using `application:which_applications()` in the Erlang shell. The version number is the last element of the tuple.
2. Compile the files (`erl -make`).
3. Take the `.beam` files in `ebin/$VSN/` and move them to `$ROOT/lib/stdlib-$VSN/ebin/` for the OTP release of your choice.
4. Start the Erlang shell associated with this version of the Erlang/OTP.
5. Enjoy Colourfull shell :)

## How to revert-back ##

Manually :

1. got to `$ROOT/lib/stdlib-$VSN/ebin/` and remove `io_lib_pretty.beam`,`lib.beam`,`shell_profile.beam` and `shell.beam`.
2. Backup file will be there with extension `.backup-pre-pretty-erlshell`. like `io_lib_pretty.beam.backup-pre-pretty-erlshell`, `lib.beam.backup-pre-pretty-erlshell` and so on.
3. Remove Back file extension ie. `.backup-pre-pretty-erlshell`
4. restart Erlang Shell.
5. done :)

## Author ##

- Prakash Parmar ( prakash.parmar@outlook.com )

## Thanks ##

Thanks to Fred Hebert for details explanation about erlang shell and its working on his ![Blog Post](https://ferd.ca/repl-a-bit-more-and-less-than-that.html)

