function validate() {

	    var title = document.getElementById("title_input").value;
	    if (title.trim() == "") {
	        alert("제목을 입력해주세요.");
	        return false;
	    }


	    var content = document.getElementById("content_input").value;
	    if (content.trim() == "") {
	        alert("내용을 입력해주세요.");
	        return false; 
	    }

	    var file = document.getElementById("file").value;
	    if (file.trim() == "") {
	        alert("파일을 업로드해주세요.");
	        return false;
	    }


	    return true;
	}