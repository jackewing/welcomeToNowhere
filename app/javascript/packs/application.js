// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
// require('dotenv').config({path:__dirname+'/./../../../.env'})

Rails.start();
Turbolinks.start();
ActiveStorage.start();

import Client from "shopify-buy";

// Initializing a client to return content in the store's primary language
const client = Client.buildClient({
  domain: "eyegum.myshopify.com",
  storefrontAccessToken: "3d8921da235f01fcf0d51ad2fb3997e7",
});

// Fetch all products in your shop
client.product.fetchAll().then((products) => {
  // Do something with the products
  a = document.getElementById("product");
  a.style = "background-image: " + products[0].images.src;
  products[0].images.src;
});
