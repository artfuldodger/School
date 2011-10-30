Lab1::Application.routes.draw do
  match "/greeting" => "greeting#index"
  root :to => "greeting#index"
end
