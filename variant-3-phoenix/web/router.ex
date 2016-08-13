defmodule HelloWorld.Router do
  use HelloWorld.Web, :router

  scope "/", HelloWorld do
    get "/hello", HelloWorldController, :hello
    get "/hello/:name", HelloWorldController, :hello

    get "/*path", HelloWorldController, :goodbye
    post "/*path", HelloWorldController, :goodbye
    put "/*path", HelloWorldController, :goodbye
    patch "/*path", HelloWorldController, :goodbye
    delete "/*path", HelloWorldController, :goodbye
  end
end
