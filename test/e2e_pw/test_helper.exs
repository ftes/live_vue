# ExUnit port of the Playwright suite in test/e2e. Run with `MIX_ENV=e2e mix test`
# after `npm run e2e:build`. Replaces the `webServer` of test/e2e/playwright.config.js.
# Playwright Test hides the webServer output; the e2e env has no logger config.
Logger.configure(level: :warning)

Code.require_file("../e2e/server.exs", __DIR__)
Code.require_file("support/utils.ex", __DIR__)
Code.require_file("support/case.ex", __DIR__)

ExUnit.start()
