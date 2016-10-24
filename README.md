# lfe-version

*The LFE rebar3 version plugin*

[lr3-logo]: priv/images/logo.png

[![][lr3-logo]][lr3-logo]


#### Contents [&#x219F;](#contents)

* [Build](#build-)
* [Use](#use-)


## Build


```bash
$ rebar3 compile
```


## Use [&#x219F;](#contents)

Add the required plugins and provider hooks to your ``rebar.config``:

```erlang
{plugins, [
  {'lfe-compile', ".*",
    {git, "https://github.com/lfe-rebar3/compile.git", {tag, "0.5.0"}}},
  {'lfe-version', ".*",
    {git, "https://github.com/lfe-rebar3/version.git", {tag, "0.4.0"}}}
]}.

{provider_hooks, [
   {post, [{compile, {lfe, compile}}]}
  ]}.
```

Then just call the plugin directly from your project directory:

```bash
$ rebar3 help lfe version

The LFE rebar3 version plugin.

Display the version info for LFE as well as major components of Erlang/OTP.


Usage: rebar3 lfe version
```

```bash
$ rebar3 lfe version
(#(erlang "18")
 #(emulator "7.0")
 #(driver-version "3.2")
 #(lfe "1.1.1")
 #(rebar "3.1.1"))
```

## License [&#x219F;](#contents)

BSD 3-Clause License

Copyright © 2015-2016, Duncan McGreggor <oubiwann@gmail.com>

Copyright © 2016, Eric Bailey <eric@ericb.me>
