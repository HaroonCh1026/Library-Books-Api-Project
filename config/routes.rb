Rails.application.routes.draw do
  # Author Routes
  get    "/authors",     to: "authors#index"
  get    "/authors/:id", to: "authors#show"
  post   "/authors",     to: "authors#create"
  put    "/authors/:id", to: "authors#update"
  patch  "/authors/:id", to: "authors#update"
  delete "/authors/:id", to: "authors#destroy"

  # Book Routes
  get    "/books",     to: "books#index"
  get    "/books/:id", to: "books#show"
  post   "/books",     to: "books#create"
  put    "/books/:id", to: "books#update"
  patch  "/books/:id", to: "books#update"
  delete "/books/:id", to: "books#destroy"
end
