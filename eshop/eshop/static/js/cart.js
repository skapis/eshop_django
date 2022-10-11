const qty = document.querySelectorAll('.qty_input')
const cart_total = document.getElementById('cartTotal')



qty.forEach(item =>{
    item.addEventListener('input', function(){
        console.log(item.id)
        console.log(item.value)
        fetch("update/"+ item.id +"/"+ item.value)
            .then((res)=> res.json()).then((results)=>{
                console.log("results", results);
                const total_price = document.getElementById('total'+item.id)
                total_price.innerHTML = results.total
            fetch("cart-total").then((res)=> res.json()).then((cartTotal)=>{
                console.log(cartTotal);
                cart_total.innerText = cartTotal.total
                console.log(results.available_amount)
                if (results.available_amount == 0) {
                    alert("Sorry, but you cannot order more than available amount of product")
                }
                });
            })
    })
})