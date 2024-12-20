import "@hotwired/turbo-rails";
import Rails from "@rails/ujs";
Rails.start();
import "controllers";
// jQueryやBootstrapのimportはこの後に記述
import "jquery";
import "popper.js";
import "bootstrap";
//= require rails-ujs
//= require_tree .
import "../tasks";
import "../schedules";