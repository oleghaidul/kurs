// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
  $("#products_search input").keyup(function() {
    $.get($("#products_search").attr("action"), $("#products_search").serialize(), null, "script");
    return false;
  });
});
