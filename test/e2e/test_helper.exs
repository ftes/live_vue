# Browser suite: the *.spec.exs in features/. Run with `mix e2e.test`, or `MIX_ENV=e2e mix test`
# after `npm run e2e:build`. Starts the server of server.exs in this VM.
# The e2e env has no logger config: keep the server's request logs out of the test output.
Logger.configure(level: :warning)

Code.require_file("server.exs", __DIR__)
Code.require_file("support/utils.ex", __DIR__)
Code.require_file("support/case.ex", __DIR__)

ExUnit.start(timeout: 30_000)
