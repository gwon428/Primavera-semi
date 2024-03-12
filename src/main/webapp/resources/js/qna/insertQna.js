function validate() {
		let f = document.insertQna;
		
		if (f.id_input.value == '') {
		  	f.id_input.focus();
	        return false;
		} else if(f.orderNum_input.value == ''){
		    f.orderNum_input.focus();
		    return false;
		} else if(f.title_input.value == ''){
		    f.title_input.focus();
		    return false;
		}else if(f.content_input.value == ''){
		    f.content_input.focus();
		    return false;
		}
		    alert("Q&A 등록에 성공하였습니다.");
		    return true; 
	}
		 