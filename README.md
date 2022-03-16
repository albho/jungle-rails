# Jungle

A mini e-commerce application built with Rails 4.2. A practice project for learning to navigate and contribute to an existing codebase.

## Tech Stack

Front End:

- ERB

Back End:

- Ruby on Rails
- PostgreSQL

Testing:

- RSpec
- Capybara
- Poltergeist

## Demo

### Users can view all products on the home page.

![all products](https://github.com/albho/jungle-rails/blob/master/docs/1-all-products.png?raw=true)

### Users can view products filtered by category.

![categories](https://github.com/albho/jungle-rails/blob/master/docs/2-categories.png?raw=true)

### Users can view product details.

![product details](https://github.com/albho/jungle-rails/blob/master/docs/3-product-details.png?raw=true)

### Users can add items to cart, checkout with credit card, and receive an order confirmation.

![cart](https://github.com/albho/jungle-rails/blob/master/docs/4-cart.png?raw=true)

![checkout](https://github.com/albho/jungle-rails/blob/master/docs/5-checkout.png?raw=true)

![order confirmation](https://github.com/albho/jungle-rails/blob/master/docs/6-order-confirmation.png?raw=true)

![empty cart](https://github.com/albho/jungle-rails/blob/master/docs/7-empty-cart.png?raw=true)

### Admins can view all products and create new ones.

![admin products](https://github.com/albho/jungle-rails/blob/master/docs/8-admin-products.png?raw=true)

![admin new product](https://github.com/albho/jungle-rails/blob/master/docs/9-admin-new-product.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
