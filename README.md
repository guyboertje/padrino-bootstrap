padrino-bootstrap
=================

A simple Padrino bootstrap with Sass, Slim, Jade, Sprockets, and Twitter Bootstrap

modified for Jade via JrJade (on JRuby only)

In development mode...

The welcome-j Jade template is rendered so:
```
  DEBUG -       GET (0.0280s) /jade - 200 OK
```

The welcome-s Slim template is rendered so:
```
  DEBUG -       GET (0.1580s) /slim - 200 OK
```

In production mode with Tilt compiled template caching there is very little between them.

But with JrJade you get almost the speed of production mode during development
