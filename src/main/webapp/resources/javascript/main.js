"use strict";

// Join

function selectAll(selectAll) {
  const checkboxes = document.getElementsByName("agreecheck");

  checkboxes.forEach((checkbox) => (checkbox.checked = selectAll.checked));
}

function checkSelectAll() {
  const checkboxes = document.querySelectorAll('input[name="agreecheck"]');
  const checked = document.querySelectorAll('input[name="agreecheck"]:checked');
  const selectAll = document.querySelector('input[name="selectall"]');

  if (checkboxes.length === checked.length) {
    selectAll.checked = true;
  } else {
    selectAll.checked = false;
  }
  // selectAll.checked = checkboxes.length === checked.length;
}
