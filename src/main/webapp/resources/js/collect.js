const navIcons = document.querySelectorAll("i");
const list = document.querySelectorAll(".image-content");
     
navIcons[0].addEventListener("click", function(){
	list.forEach((a)=>{
		a.classList.remove("header-main-bottom-right");
	});
});
     
navIcons[1].addEventListener("click", function () {
	list.forEach((a) => {
		a.classList.add("header-main-bottom-right");
	});
});
