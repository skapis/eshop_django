const newCategory = document.getElementById('newCategory')
const newCategoryForm = document.getElementById('newCatForm')
const editCategorybtn = document.querySelectorAll('.editCategory')
const shipEditBtn = document.getElementById('shippingedit')


newCategory.onclick = function(){
    newCategory.style.display = 'none';
    newCategoryForm.style.display = 'block';
};


editCategorybtn.forEach(item=>{
    item.onclick = function(){
        var name = document.getElementById('catName_'+item.id)
        var nameForm = document.getElementById('editCatForm_'+item.id)
        if (nameForm.style.display == 'none'){
            name.style.display = 'none';
            nameForm.style.display = 'block';
        }
        else{
            name.style.display = 'block';
            nameForm.style.display = 'none';
        };
    }
})





