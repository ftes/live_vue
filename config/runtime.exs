import Config

# test/e2e/playwright.config.js's `chromium` project: `use: { ...devices['Desktop Chrome'] }`, under
# every module's options. Here, as config.exs runs before Playwright.device/1 is compiled.
if config_env() == :e2e do
  config :playwright, :test, Enum.to_list(Playwright.device("Desktop Chrome"))
end
