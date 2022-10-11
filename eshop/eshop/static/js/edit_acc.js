const editAcc = document.getElementById('edit_acc')
const editBlock = document.getElementById('account_info_edit')
const accInfo = document.getElementById('account_info')
const AddressEdit = document.querySelectorAll('.editAddress')


editAcc.onclick = function(){
    if (editBlock.style.display == 'none'){
        editBlock.style.display = 'block';
        accInfo.style.display = 'none'; 
    }
    else{
        editBlock.style.display = 'none';
        accInfo.style.display = 'block';
    }
    
};



AddressEdit.forEach(item =>{
    item.onclick = function(){
        var editAddressBlock = document.getElementById('editblock_'+ item.id)
        if (editAddressBlock.style.display == 'none'){
            editAddressBlock.style.display = 'block';
        }
        else{
            editAddressBlock.style.display = 'none';
        }
    }; 
});
