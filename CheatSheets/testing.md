# Testing Strategies

## *-box
Strategies based on whether you know (or want to know) about how the system you're testing works.

- _black box_: I don't understand the code. It's just a black box. I put inputs in one end, and I complain when I don't get the results I want out the other end.
- _glass box_: I can see and understand the code. When it breaks, I can figure out why and fix it myself or create a more detailed bug report.

## *-driven development (*DD)
Write the testing code first, before you write the application code. Red-Green-Refactor.

- _test-driven development (TDD)_: I write tests before I write code.
- _behavior-driven development (BDD)_: I write specs (specifications, or executable documentation) before I write code.

# Test Types

## Unit Test
Testing the smallest testable units of a system. (e.g. testing individual methods)

- In Rails it's called a _model test_
- In RSpec it's called a _model spec_

## Functional Test
Testing a single behavior of a system (sometimes touching multiple units). (e.g. testing a single page)

- In Rails: _controller test_ (now deprecated in favor of integration testing)
- In RSpec: _feature spec_

## Integration Test
Testing the interaction of multiple behaviors.

- Rails: _integration test_, _system test_
  - test the entire MVC stack
  - test a single page or a workflow (multiple pages)
- RSpec: _feature spec_

## Acceptance Test
- What "the suits" call tests that they can read and understand to determine if what you've built is _acceptable_.
- aka. _customer test_ (as distinct from a _developer test_)

## Smoke Test
If all your tests take a long time to run, and you need a quick indication of _go_ or _no go_, a smoke test is a test of only the most important subset of all the tests. For example, just make sure the homepage loads and that customers can buy stuff.
