const msg = document.querySelectorAll('.bi-x')


msg.forEach(item=>{
    item.onclick = function(){
        console.log(item.parentElement)
        item.parentElement.remove()
    }
})
