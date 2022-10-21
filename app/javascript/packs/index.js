import $ from 'jquery'
import 'select2'

$(function () {
  $('.js-searchable').select2({
    dropdownAutoWidth: true,
    placeholder: "サービス種別を入力",
    theme: 'bootstrap5'
  });
});