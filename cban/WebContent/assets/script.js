function writeSave(writeForm){
	
	if(!writeForm.writer.value){
	  alert("작성자를 입력하십시요.");
	  writeForm.writer.focus();
	  return false;
	}
	
	if(!writeForm.subject.value){
	  alert("제목을 입력하십시요.");
	  writeForm.subject.focus();
	  return false;
	}
	
	if(!writeForm.content.value){
	  alert("내용을 입력하십시요.");
	  writeForm.content.focus();
	  return false;
	}
        
	var passwd = writeForm.passwd.value;
	if(!passwd || passwd.length < 4){
	  alert("4자리 이상의 비밀번호를 입력하십시요.");
	  writeForm.passwd.focus();
	  return false;
	}
	
	return true;
 };
 
function deleteSave(delForm){	
	if(!delForm.passwd.value){
	   alert("비밀번호를 입력하십시요.");
	   delForm.passwd.focus();
	   return false;
   }
	return true;
};    

//searchForm changed
function selectField() {
	$(document).ready(function() {
		var keyField = $('[name=keyField] option:selected').val();
		if(!keyField){
			$('#inputKwd').attr('disabled', true);
			$('#inputCtg').attr('disabled', true);
		} 
		if(keyField == 'category') { //카테고리 선택
			$('#inputKwd').attr('disabled', true);
			$('#inputCtg').removeAttr('disabled');
		} else if(keyField != 'category') {
			$('#inputKwd').removeAttr('disabled');
			$('#inputCtg').attr('disabled', true);
		} 
	});
};

//searchForm onsubmit
function searchCheck(searchForm) {
	var keyField = $('[name=keyField]').val();
	var keyWord = $('[name=keyWord').val();

	if(!keyField) {
		alert('검색할 항목을 선택해주세요.');
		return false;
	} 
	if(!keyWord) {
		alert('카테고리를 선택하거나 검색어를 입력해 주세요.');
		return false;
	} 
	alert('정상입니다');
	return true;
};
