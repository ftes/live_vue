defmodule LiveVue.E2E.Case do
  @moduledoc """
  The `chromium` project of test/e2e/playwright.config.js: a pooled browser and, per test, a
  context of the "Desktop Chrome" device.
  """
  use ExUnit.CaseTemplate
  use Playwright.Test

  alias Playwright.Browser
  alias Playwright.BrowserContext
  alias Playwright.Test.BrowserPool

  using opts do
    quote do
      use Playwright.Test, unquote(opts)

      import LiveVue.E2E.Utils

      alias Playwright.Browser
      alias Playwright.BrowserContext
      alias Playwright.Expect
      alias Playwright.Locator
      alias Playwright.Page

      @moduletag :e2e
    end
  end

  setup_all do
    browser = BrowserPool.browser()
    device = Map.fetch!(Playwright.devices(BrowserPool.playwright(browser)), "Desktop Chrome")
    %{browser: browser, device: device}
  end

  setup %{browser: browser, device: device} do
    context = Browser.new_context!(browser, device)
    %{context: context, page: BrowserContext.new_page!(context)}
  end
end
