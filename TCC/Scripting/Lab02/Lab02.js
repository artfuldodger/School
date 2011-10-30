errorDiv = document.getElementById('error');
resultDiv = document.getElementById('result');

// Had the div's displaying result/error before noticing that we're required to use alert().
function showError(error) {
  errorDiv.innerHTML = error;
  resultDiv.innerHTML = '';
  alert(error);
}

function showResult(result) {
  resultDiv.innerHTML = result;
  errorDiv.innerHTML = '';
  alert(result);
}

function isValidNumber(number) {
	return !isNaN(number) && number != '' && Number(number) > 0
}

function calculate() {
  var width = prompt("Please enter the width of a rectangle:");
  if (!isValidNumber(width)) {
    showError('You did not enter a valid number for the width.');
    return;
  }
  
  var height = prompt("Please enter the height of a rectangle:");
  if (!isValidNumber(height)) {
    showError('You did not enter a valid number for the height.');
    return;
  }
  
  var area = width * height;
  showResult('The area is ' + area);
}

calculate();