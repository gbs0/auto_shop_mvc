// TODO: Build an awesome garage!
const carForm = document.getElementById("new-car");
const garage = "Drive-In";

carForm.addEventListener("submit", (event) => {
  event.preventDefault();
  const brand = document.getElementById("brand").value;
  const model = document.getElementById("model").value;
  const owner = document.getElementById("owner").value;
  const plate = document.getElementById("plate").value;

  const url = `https://wagon-garage-api.herokuapp.com/${garage}/cars`;
  const car = {
      "brand": brand,
      "model": model,
      "owner": owner,
      "plate": plate
  }

  fetch(url, {
  method: 'post',
  headers: {'Content-Type': 'application/json'},
  body:
    JSON.stringify(car)
      }).then(() => {
        alert("Car saved");
        fetchAllCars();
      });
});

function carRow(car) {
  const row = `<div class="car">
          <div class="car-image">
            <img src="http://loremflickr.com/280/280/${car.brand} ${car.model}" />
          </div>
          <div class="car-info">
            <h4>${car.brand} ${car.model}</h4>
            <p><strong>Owner:</strong> ${car.owner}</p>
            <p><strong>Plate:</strong> ${car.plate}</p>
            <p><a href='#' class='btn remove-btn' data-id='${car.id}' >REMOVE</a></p>
          </div>
        </div>`
  return row;
};

function bindRemoveBtn() {
  document.querySelectorAll('.remove-btn').forEach((btn) => {
    btn.addEventListener('click', (event) => {
      event.preventDefault();
      const id = event.currentTarget.dataset.id;

      const url = `https://wagon-garage-api.herokuapp.com/cars/${id}`;
      fetch(url, {method: 'DELETE'})
      .then( () => {
        alert('Car Removed!');
        fetchAllCars();
      });
    })
  });
}


function fetchAllCars() {
  const url = `https://wagon-garage-api.herokuapp.com/${garage}/cars`;
  const carsList = document.querySelector('.cars-list');
  carsList.innerHTML = null;
  fetch(url)
  .then((response) => response.json())
  .then((data) => {
    data.forEach((car) => {
      const carData = carRow(car);
      carsList.insertAdjacentHTML('beforeend',carData);
    });
    bindRemoveBtn();
  })
}

fetchAllCars();
