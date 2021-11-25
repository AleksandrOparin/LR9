document.addEventListener("DOMContentLoaded", function() {
   document.getElementById('Result').addEventListener('click', send_query)
});

index_url = location.protocol + "//" + location.host + "/index/output.json";
function send_query() {
    var InputNumber = document.getElementById("InputNumber");
    var param_str = "?" + "InputNumber=" + InputNumber.value;

    if (param_str == "?InputNumber=") return false;
    var my_JSON_object = {};
    var http_request = new XMLHttpRequest();
    http_request.open("GET", index_url + param_str, true);
    http_request.onreadystatechange = function () {
        var done = 4,
        ok = 200;
        if (http_request.readyState == done && http_request.status == ok) {
            my_JSON_object = JSON.parse(http_request.responseText);
            show_result(my_JSON_object);
        }
    };
    http_request.send(null);
    return false;
}

function show_result(data) {
    const result = document.getElementById("ResultTable")
    const tbody = document.createElement('tbody')
    const length = document.getElementById('LengthResult')

    result.innerHTML = `
        <thead>
            <tr>
                <th> Число </th>
                <th> Квадрат числа </th>
            </tr>
        </thead>
    `;

    let index = 0

    data.value.forEach((element) => { 
        tbody.innerHTML += `
            <tr>
                <td id="output${ index++ }"> ${ element } </td>
                <td> ${ element**2 } </td>
            </tr>
        `
    })

    length.innerHTML = `
      <div class="input-group-prepend">
         <span class="input-group-text"> Количество чисел: </span>
      </div>
      <input type="text" class="form-control" id="Length" placeholder="Количество чисел" value="${ data.value.length }" readonly>
    `

    result.appendChild(tbody)
    result.after(length)
}