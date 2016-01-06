# Yellowtail

This is an exercise in creating lightweight, modular endpoints.

# Installation

```shell
$ gem install bundler
$ bundle install
```

# Running

```shell
$ ruby yellowtail.rb
```

# Yellowtail in Action

## Average Word Length Endpoint

### Request

```shell
$ curl -X POST -H "Content-type: application/json" -d "{\"text\":\"My cat is gray. It doesn\'t have feathers.\"}" http://localhost:4567/words/avg_len
```

### Response

```
3.875
```

## Average Sentence Length Endpoint

### Request

```shell
$ curl -X POST -H "Content-type: application/json" -d "{\"text\":\"My cat is gray. It doesn\'t have feathers.\"}" http://localhost:4567/sentences/avg_len
```

### Response

```
4.0
```

# Discussion

I'm generally a big fan of the [SRP](https://en.wikipedia.org/wiki/Single_responsibility_principle), and heed it to create small modules that each serve a single purpose. That allows me here to reuse both the `WordTokenizer` and the `AverageLength` modules, for example, in multiple endpoints. After all, code reuse is a good thing.

## `WordTokenizer`

I strip out anything that's not an apostrophe, a word
character, or whitespace. Naturally, treating the apostrophe as a
permissible character is making an assumption that the submitted text is
in a language that uses apostrophes, in this case English; assumptions
like this should ideally be minimized (and the language could be
detected or parameterized, perhaps) in an app you want to scale. In
addition, it's necessary to keep apostrophes around in this step
because, for something like calculating the most common word or the word
with the median frequency, one must treat "it's" and "its" as distinct
words. (You could argue that I should leave this out until I
implement `MedianFrequencyWordFinder` and `ModeFrequencyWordFinder`,
and you'd be right, by the [YAGNI principle](https://en.wikipedia.org/wiki/You_aren%27t_gonna_need_it).)

## `SentenceTokenizer`

I split on periods, exclamation points, and question marks. Again, this
is a decision biased toward English, as other languages use other
punctuation characters to delimit sentences. In addition, there are
other punctuation characters in English that delimit sentences, such as
ellipses. It would be pretty trivial to include them all in the regular
expression I use (after creating the appropriate unit tests, of course).

## `LettersOnlyFilter`

We need this particularly because we leave in apostrophes in the `WordTokenizer`.

## `yellowtail.rb`

Simple [Sinatra](http://www.sinatrarb.com/) app that routes HTTP
requests to the appropriate module.

