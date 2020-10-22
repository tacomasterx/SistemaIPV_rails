function substractPayment() {
    var payment_field = document.getElementById("sale_payment");
    var payment_cell = document.getElementById("pago");
    var total_cell = document.getElementById("total");
    var change_cell = document.getElementById("cambio");

    payment_cell.innerHTML = payment_field.value   //-parseFloat()
    change_cell.innerHTML = parseFloat(total_cell) - parseFloat(payment_cell)
}
